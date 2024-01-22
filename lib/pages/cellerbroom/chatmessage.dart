import 'dart:ui';
import 'package:crepe/ext/customroute.dart';
import 'package:crepe/pages/cellerbroom/imagemode.dart';
import 'package:crepe/pages/cellerbroom/mymsg.dart';
import 'package:crepe/pages/cellerbroom/othermsg.dart';
import 'package:crepe/pages/review/reviewmain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:crepe/util/GlobalFunc.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:screenshot/screenshot.dart';
import 'dart:typed_data';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

//텍스트 채팅을 보여주는 페이지
class ChatMessage extends StatefulWidget {
  const ChatMessage({Key? key}) : super(key: key);
  @override
  State<ChatMessage> createState() => _ChatMessage();
}

class _ChatMessage extends State<ChatMessage> {
  var selectedIdx = -1;
  var keyboardShown = false;
  var keyboardSubscription;
  List<Map<String, dynamic>> msgList = [];
  var msgText = "";
  var txtC = TextEditingController();

  var spentTime = "00:00";
  var isTimeout = false;
  var timer;
  final picker = ImagePicker();
  ScreenshotController screenshotController = ScreenshotController();
  Uint8List? capturedImg = null;
  var started = false;
  var isSharing = false;

  var dateStr = "";

  bool emojiShowing = false;
  final ScrollController scontroller = ScrollController();
  @override
  void initState() {
    super.initState();
    getInitMsg();
    setState(() {
      dateStr = getTodayString();
    });
    var keyboardVisibilityController = KeyboardVisibilityController();

//키보드가 보여질 때 "입력중" 메시지 표시
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      var tList = msgList;
      if (!visible) {
        if (tList.length > 0) {
          if (tList[tList.length - 1]["type"] == "progress") {
            tList.removeLast();
          }
        }
      } else {
        if (tList.length > 0) {
          if (tList[tList.length - 1]["type"] != "progress") {
            tList.add({
              'type': 'progress',
              'content': '',
              'name': 'me',
              'isMe': true,
              'avatar': '',
              'date': '',
              'time': '12:00pm',
              'status': 'none'
            });
          }
        }
      }
      setState(() {
        keyboardShown = visible;
        msgList = tList;
        if (visible) {
          emojiShowing = false;
        }
      });
      moveToBottom();
    });
  }

  //20초후에 시간 경과 표시
  void setTimer() {
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      print(timer.tick.toString());
      if (timer.tick > 20) {
        timer.cancel();
        setState(() {
          isTimeout = true;
        });
        addShareMsg();
      } else {
        int min = (timer.tick / 60).floor();
        int sec = timer.tick.floor() - 60 * min;

        setState(() {
          spentTime = "${min > 9 ? min : '0$min'}:${sec > 9 ? sec : '0$sec'}";
        });
      }
    });
  }

  void _onBackspacePressed() {
    txtC
      ..text = txtC.text.characters.toString()
      ..selection =
          TextSelection.fromPosition(TextPosition(offset: txtC.text.length));
  }

  @override
  void dispose() {
    if (keyboardSubscription != null) keyboardSubscription.cancel();
    if (timer != null) timer.cancel();
    super.dispose();
  }

//초기 메시지
  void getInitMsg() {
    setState(() {
      msgList = [
        {
          'type': 'text',
          'content': 'CELEB님이 glume님꼐\n라이브 채팅을 요청합니다.',
          'name': 'crepe',
          'isMe': false,
          'avatar': 'assets/images/c_avatar.png',
          'date': '',
          'time': '12:00pm',
          'status': 'none'
        },
        {
          'type': 'text',
          'content':
              '아티스트와의 소중한 시간을 함께하기 위해 다음과 같은 유의사항이 있습니다.채팅시 비속어나 상대방을 비하하는  발언을 삼가주세요.인신공격, 협박, 불법적인 내용 등은 반드시 삼가주세요.시작하기를 누르면 채팅이 시작됩니다. 그럼 즐거운 시간 되세요~',
          'name': 'crepe',
          'isMe': false,
          'avatar': 'assets/images/c_avatar.png',
          'date': '',
          'time': '12:00pm',
          'status': 'none'
        },
        {
          'type': 'start',
          'content': '',
          'name': 'me',
          'isMe': true,
          'avatar': '',
          'date': '',
          'time': '12:00pm',
          'status': 'none'
        }
      ];
    });
  }

  bool isFirstMsg(idx) {
    if (idx == 0) {
      return true;
    }
    if (msgList[idx]["name"] != msgList[idx - 1]["name"]) {
      return true;
    }
    return false;
  }

  void moveScroll() {
    scontroller.animateTo(
      scontroller.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void moveToBottom() {
    Timer(Duration(milliseconds: 500), () => moveScroll());
  }

//공유 메시지 추가
  void addShareMsg() {
    var tList = msgList;
    if (tList.length > 0) {
      if (tList[tList.length - 1]["type"] == "progress") {
        tList.removeLast();
      }
    }
    tList.add({
      'type': 'text',
      'content': '즐거운 시간 보내셨나요?\n',
      'name': 'crepe',
      'isMe': false,
      'avatar': 'assets/images/c_avatar.png',
      'date': '',
      'time': '12:00pm',
      'status': 'none'
    });
    tList.add({
      'type': 'text',
      'content':
          '채팅이 종료되어 더 이상 내용을\n입력할 수 없습니다.\n\n채팅 내용은 보관함에 저장됩니다. 마이페이지 보관함에서 확인하세요!',
      'name': 'crepe',
      'isMe': false,
      'avatar': 'assets/images/c_avatar.png',
      'date': '',
      'time': '12:00pm',
      'status': 'none'
    });
    tList.add({
      'type': 'share',
      'content': '',
      'name': 'me',
      'isMe': true,
      'avatar': '',
      'date': '',
      'time': '',
      'status': 'none'
    });
    txtC.text = "";
    setState(() {
      msgText = "";
      started = false;
      msgList = tList;
    });
    moveToBottom();
  }

//텍스트 메시지 보내기
  void sendTextMessage(String text) {
    var tList = msgList;
    if (tList.length > 0) {
      if (tList[tList.length - 1]["type"] == "progress") {
        tList.removeLast();
      }
    }
    tList.add({
      'type': 'text',
      'content': "안녕 루미야! ❤️\n만나서 반가워. 오늘은 뭐해?",
      'name': 'CELEB',
      'isMe': false,
      'avatar': 'assets/images/tmp/g_avatar5.png',
      'date': '',
      'time': "3:40am",
      'status': 'active'
    });
    tList.add({
      'type': 'text',
      'content': text,
      'name': 'abc',
      'isMe': true,
      'avatar': 'assets/images/c_avatar.png',
      'date': '',
      'time': getCurrentTimeString(),
      'status': 'none'
    });
    setState(() {
      msgList = tList;
    });
    moveToBottom();
  }

//이미지 메시지 보내기
  void addImgMessage(String path) {
    var tList = msgList;
    if (tList.length > 0) {
      if (tList[tList.length - 1]["type"] == "progress") {
        tList.removeLast();
      }
    }
    tList.add({
      'type': 'image',
      'content': "assets/images/tmp/g_img3.png",
      'name': 'CELEB',
      'isMe': false,
      'avatar': 'assets/images/c_avatar.png',
      'date': '',
      'time': getCurrentTimeString(),
      'status': 'none'
    });
    tList.add({
      'type': 'image',
      'content': path,
      'name': 'abc',
      'isMe': true,
      'avatar': 'assets/images/c_avatar.png',
      'date': '',
      'time': getCurrentTimeString(),
      'status': 'none'
    });
    setState(() {
      msgList = tList;
    });
    moveToBottom();
  }

  //이미지 선택(카메라 혹은 갤러리로 부터)
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      addImgMessage(pickedFile.path);
    }
  }

  //Image Picker function to get image from camera
  Future getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      addImgMessage(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: true,
          child: Screenshot(
              controller: screenshotController,
              child: Container(
                  color: Colors.white,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          Padding(padding: EdgeInsets.only(top: 80)),
                          Expanded(
                              flex: 1,
                              child: Container(
                                  padding: EdgeInsets.all(16),
                                  child: Scrollbar(
                                      thickness: 0.0, // 스크롤 너비
                                      child: ListView.builder(
                                          reverse: false,
                                          controller: scontroller,
                                          padding: const EdgeInsets.all(0),
                                          itemCount: msgList.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            if (!msgList[index]["isMe"])
                                              return Container(
                                                  padding:
                                                      EdgeInsets.only(top: 8),
                                                  child: OtherMsg(
                                                      msg: msgList[index],
                                                      isFirst:
                                                          isFirstMsg(index),
                                                      idx: index,
                                                      callback: otherMsgClick));
                                            if (msgList[index]["isMe"])
                                              return Container(
                                                  padding:
                                                      EdgeInsets.only(top: 8),
                                                  child: MyMsg(
                                                      msg: msgList[index],
                                                      isFirst:
                                                          isFirstMsg(index),
                                                      idx: index,
                                                      callback: myMsgClick));
                                            return Container(
                                              width: 0,
                                              height: 0,
                                            );
                                          })))),
                          Container(
                              width: MediaQuery.of(context).size.width,
                              height: 74,
                              color: Color.fromRGBO(255, 255, 255, 1.0),
                              child: Container(
                                  padding: EdgeInsets.only(
                                      top: 8, left: 16, right: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            if (!started) return;
                                            if (keyboardShown) {
                                              FocusScope.of(context).unfocus();
                                            }
                                            setState(() {
                                              emojiShowing = !emojiShowing;
                                            });
                                          },
                                          child: Container(
                                              width: 30,
                                              height: 30,
                                              child: Center(
                                                  child: SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: Image.asset(
                                                    "assets/images/b_add_circle_icon.png"),
                                              )))),
                                      // if (!keyboardShown)
                                      // Padding(
                                      //     padding: EdgeInsets.only(left: 10)),
                                      Builder(builder: (context) {
                                        return GestureDetector(
                                            onTap: () {
                                              if (!started) return;
                                              if (keyboardShown ||
                                                  emojiShowing) {
                                                if (msgText.isNotEmpty) {
                                                  sendTextMessage(msgText);
                                                  txtC.text = "";
                                                }
                                              } else {
                                                Scaffold.of(context)
                                                    .showBottomSheet<void>(
                                                  (BuildContext context) {
                                                    return ImageMode(
                                                        openCamera:
                                                            getImageFromCamera,
                                                        openGallery:
                                                            getImageFromGallery);
                                                  },
                                                );
                                              }
                                            },
                                            child: Container(
                                              width: 30,
                                              height: 30,
                                              child: Center(
                                                  child: SizedBox(
                                                width: 24,
                                                height: 24,
                                                child: Image.asset(keyboardShown ||
                                                        emojiShowing
                                                    ? "assets/images/b_arrownext_icon.png"
                                                    : "assets/images/b_msg_icon.png"),
                                              )),
                                            ));
                                      }),
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                              height: 40,
                                              padding: EdgeInsets.only(
                                                  left: 8, right: 8),
                                              child: TextField(
                                                  readOnly: !started,
                                                  textAlignVertical:
                                                      TextAlignVertical.center,
                                                  decoration: InputDecoration(
                                                    filled: true,
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 14,
                                                            left: 16,
                                                            right: 10),
                                                    fillColor: Color.fromRGBO(
                                                        0, 0, 0, 0.05),
                                                    hintText: "채팅을 입력하세요.",
                                                    hintStyle: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.4)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1.0),
                                                    ),
                                                  ),
                                                  style: TextStyle(
                                                      fontFamily: 'pretendard',
                                                      height: 1,
                                                      fontSize: 14,
                                                      decorationThickness: 0.0,
                                                      color: Colors.black),
                                                  controller: txtC,
                                                  textInputAction:
                                                      TextInputAction.send,
                                                  onSubmitted: (value) {
                                                    if (msgText.isNotEmpty) {
                                                      sendTextMessage(msgText);
                                                      txtC.text = "";
                                                    }
                                                  },
                                                  onChanged: (text) {
                                                    setState(() {
                                                      msgText = text;
                                                    });
                                                  })))
                                    ],
                                  ))),
                          Offstage(
                            offstage: !emojiShowing,
                            child: SizedBox(
                                height: 250,
                                child: EmojiPicker(
                                  onEmojiSelected: (category, emoji) => {
                                    setState(() {
                                      msgText = msgText + emoji.emoji;
                                    })
                                  },
                                  textEditingController: txtC,
                                  onBackspacePressed: _onBackspacePressed,
                                  config: Config(
                                    columns: 7,
                                    emojiSizeMax: 32 *
                                        (foundation.defaultTargetPlatform ==
                                                TargetPlatform.iOS
                                            ? 1.30
                                            : 1.0),
                                    verticalSpacing: 0,
                                    horizontalSpacing: 0,
                                    gridPadding: EdgeInsets.zero,
                                    initCategory: Category.RECENT,
                                    bgColor: const Color(0xFFF2F2F2),
                                    indicatorColor: Colors.blue,
                                    iconColor: Colors.grey,
                                    iconColorSelected: Colors.blue,
                                    backspaceColor: Colors.blue,
                                    skinToneDialogBgColor: Colors.white,
                                    skinToneIndicatorColor: Colors.grey,
                                    enableSkinTones: true,
                                    recentTabBehavior: RecentTabBehavior.RECENT,
                                    recentsLimit: 28,
                                    replaceEmojiOnLimitExceed: false,
                                    noRecents: const Text(
                                      'No Recents',
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          fontSize: 20,
                                          color: Colors.black26),
                                      textAlign: TextAlign.center,
                                    ),
                                    loadingIndicator: const SizedBox.shrink(),
                                    tabIndicatorAnimDuration:
                                        kTabScrollDuration,
                                    categoryIcons: const CategoryIcons(),
                                    buttonMode: ButtonMode.MATERIAL,
                                    checkPlatformCompatibility: true,
                                  ),
                                )),
                          )
                        ],
                      ),
                      Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 80,
                              padding:
                                  EdgeInsets.only(left: 16, right: 16, top: 8),
                              child: Column(children: [
                                Container(
                                  height: 30,
                                  child: Row(children: [
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Center(
                                              child: SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                                "assets/images/back_icon.png"),
                                          )),
                                        )),
                                    Spacer(),
                                    Text(
                                      'CELEB',
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Spacer(),
                                    GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Center(
                                              child: SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                                "assets/images/b_menu_icon.png"),
                                          )),
                                        ))
                                  ]),
                                ),
                                Padding(padding: EdgeInsets.only(top: 8)),
                                Container(
                                    height: 32,
                                    child: Row(children: [
                                      Text(
                                        dateStr,
                                        style: TextStyle(
                                            fontFamily: 'pretendard',
                                            color: Color.fromRGBO(0, 0, 0, 0.6),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Spacer(),
                                      Container(
                                          width: 90,
                                          height: 32,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                              color: spentTime == "00:00"
                                                  ? Color.fromRGBO(0, 0, 0, 0.7)
                                                  : Color.fromRGBO(
                                                      0, 172, 255, 1)),
                                          child: Center(
                                              child: Text(
                                            spentTime,
                                            style: TextStyle(
                                                fontFamily: 'pretendard',
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w700),
                                          )))
                                    ]))
                              ]))),
                      if (isSharing)
                        Positioned(
                          left: 0,
                          top: 0,
                          child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                child: Stack(children: [
                                  Positioned(
                                      bottom: 380,
                                      left: 0,
                                      child: Container(
                                          height: 350,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: capturedImg != null
                                              ? Center(
                                                  child: Image.memory(
                                                      capturedImg!,
                                                      fit: BoxFit.fitHeight))
                                              : Text("")))
                                ]),
                              )),
                        )
                    ],
                  ))),
        ));
  }

  void otherMsgClick(int idx, String type) {}
  void myMsgClick(int idx, String type) {
    if (type == "start_close") {
      setState(() {
        var tList = msgList;
        tList.removeAt(idx);
        msgList = tList;
      });
    } else if (type == "start_start") {
      setState(() {
        var tList = msgList;
        tList.removeAt(idx);
        started = true;
        msgList = tList;
      });
      setTimer();
    } else if (type == "share_close") {
      setState(() {
        var tList = msgList;
        tList.removeAt(idx);
        msgList = tList;
      });
    } else if (type == "share_start") {
      screenshotController
          .capture(delay: Duration(milliseconds: 10))
          .then((capturedImage) async {
        setState(() {
          isSharing = true;
          capturedImg = capturedImage;
        });
      }).catchError((onError) {
        print(onError);
      });
    } else if (type == "share_confirm") {
      setState(() {
        var tList = msgList;
        tList.removeAt(idx);
        msgList = tList;
      });
    } else if (type == "sharemodal_close") {
      setState(() {
        isSharing = false;
      });
    } else if (type == "sharemodal_instagram") {
      setState(() {
        isSharing = false;
      });
      Navigator.of(context).push(CreateRoute(ReviewMain()));
    } else if (type == "sharemodal_facebook") {
      setState(() {
        isSharing = false;
      });
      Navigator.of(context).push(CreateRoute(ReviewMain()));
    } else if (type == "sharemodal_twitter") {
      setState(() {
        isSharing = false;
      });
      Navigator.of(context).push(CreateRoute(ReviewMain()));
    }
  }
}
