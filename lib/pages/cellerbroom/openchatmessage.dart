import 'dart:ui';
import 'package:crepe/ext/customroute.dart';
import 'package:crepe/pages/cellerbroom/imagemode.dart';
import 'package:crepe/pages/cellerbroom/mymsg.dart';
import 'package:crepe/pages/cellerbroom/othermsg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:crepe/util/GlobalFunc.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;

//오픈 톡 채팅 페이지
class OpenChatMessage extends StatefulWidget {
  const OpenChatMessage(
      {Key? key, required this.tabIdx, required this.itemData})
      : super(key: key);
  final int tabIdx;
  final Map<String, dynamic> itemData;

  @override
  State<OpenChatMessage> createState() => _OpenChatMessage();
}

class _OpenChatMessage extends State<OpenChatMessage> {
  var keyboardShown = false;
  var keyboardSubscription;
  List<Map<String, dynamic>> msgList = [];
  var msgText = "";
  var txtC = TextEditingController();

  final picker = ImagePicker();
  Uint8List? capturedImg = null;
  int tabIdx = 0;
  bool isTranslating = false;
  String title = "";
  //위의 탭바 리스트
  var tabNames = ['전체', '이미지/영상', '사담', '공지', '링크', '굿즈 거래'];

  bool emojiShowing = false;

  @override
  void initState() {
    super.initState();
    setInitTab();

    var keyboardVisibilityController = KeyboardVisibilityController();

    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      var tList = msgList;
      setState(() {
        keyboardShown = visible;

        if (!visible) {
          if (tList[0]["type"] == "progress") {
            tList.removeAt(0);
            msgList = tList;
          }
        } else {
          if (tList[0]["type"] != "progress") {
            tList.insert(0, {
              'type': 'progress',
              'content': '',
              'name': 'me',
              'isMe': true,
              'avatar': '',
              'date': '',
              'time': '12:00pm',
              'status': 'none'
            });
            msgList = tList;
            emojiShowing = false;
          }
        }
      });
    });
  }

  @override
  void dispose() {
    if (keyboardSubscription != null) keyboardSubscription.cancel();
    super.dispose();
  }

  void setInitTab() {
    setState(() {
      title = widget.itemData["title"].toString();
      tabIdx = widget.tabIdx;
    });
    getInitMsg();
  }

  //초기 메시지 읽기, 현재 하드 코딩으로 메시지 입력
  void getInitMsg() {
    setState(() {
      if (widget.tabIdx == 5)
        msgList = [
          {
            'type': 'text',
            'content': '와!\n감사합니다! 저도 살래요',
            'name': '페퍼민트',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
          },
          {
            'type': 'textimg_ad',
            'content': 'assets/images/tmp/ad_img5.png',
            'title': '[미공포] 스마일보이 정규 2집 1번째 스마일보이',
            'subdes1': '수량 1set 2개 남음, 개별 가능, 택포, 인증o',
            'subdes2': '세트 7.8 개별 1.6',
            'name': '스마보',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU',
            'favCnt': 127
          },
          {
            'type': 'text',
            'content': '저 있어요!\n어때요?',
            'name': '스마보',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar4.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
          },
          {
            'type': 'text',
            'content': '저두!!! 찾기 힘들었어요ㅜㅜ',
            'name': '스마일리',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar3.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
          },
          {
            'type': 'text',
            'content': '저도!!! 궁금해요',
            'name': '페퍼민트',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar2.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
          },
          {
            'type': 'text',
            'content': '포카 정규2집 1번째 에디션\n있을까요?',
            'name': 'me',
            'isMe': true,
            'avatar': 'assets/images/tmp/g_avatar12.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
          },
          {
            'type': 'text',
            'content': '포카 정규2집 1번째 에디션\n찾아요?',
            'name': 'me',
            'isMe': true,
            'avatar': 'assets/images/tmp/g_avatar12.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
          }
        ];
      else if (widget.itemData["title"].toString().contains("고독한 스마일보이") ||
          widget.itemData["title"].toString().contains("SMB 덕메 구해요!"))
        msgList = [
          {
            'type': 'text',
            'content': '수익을 우리 스마보가 받아요😎',
            'name': '스마일리',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU'
          },
          {
            'type': 'text',
            'content': '이거 보면 뭐가 좋아요?',
            'name': 'me',
            'isMe': true,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'ES'
          },
          {
            'type': 'text',
            'content': '10,000개까지 달려보죠! ',
            'name': '스마보 러버',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'KR'
          },
          {
            'type': 'text',
            'content': '와!!\n와!!\n우리 벌써100개 모였어요?',
            'name': '스마보 러버',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'KR'
          },
          {
            'type': 'image_ad',
            'content': 'assets/images/tmp/ad_img1.png',
            'name': '광고봇',
            'isMe': false,
            'avatar': 'assets/images/c_avatar.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'favCnt': 0
          },
          {
            'type': 'text',
            'content':
                '축하해요🎉 Talk 100개를 달성하여 광고를 하나 가져왔어요! \n광고 수익이 모여 셀럽에게 전달됩니다 >',
            'name': '광고봇',
            'isMe': false,
            'avatar': 'assets/images/c_avatar.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none'
          },
          {
            'type': 'text',
            'content': '오 좋아요!!',
            'name': 'SMBOO',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar2.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
            'country': 'KR'
          }
        ];
      else if (widget.itemData["title"].toString().contains("스마일보이 응원 총공") ||
          widget.itemData["title"].toString().contains("고독한 스마일보이"))
        msgList = [
          {
            'type': 'text',
            'content': '저도 하나 만들어봤는데 어때여??',
            'name': '페퍼민트',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'KR'
          },
          {
            'type': 'image_ad',
            'content': 'assets/images/tmp/ad_img4.png',
            'name': '페퍼민트',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'KR'
          },
          {
            'type': 'text',
            'content': '확인해보니까 텍스트나 초상권 없는 이미지 사용해야 된대용',
            'name': 'SMBOOO',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU'
          },
          {
            'type': 'image_ad',
            'content': 'assets/images/tmp/ad_img3.png',
            'name': 'SMBOOO',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU'
          },
          {
            'type': 'image_ad',
            'content': 'assets/images/tmp/ad_img2.png',
            'name': '이모티콘 봇',
            'isMe': false,
            'avatar': 'assets/images/c_avatar.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'favCnt': 127
          },
          {
            'type': 'text',
            'content': '우리 팬덤만의 이모티콘을 만들어 사용하세요!\n팬이 직접 만드는 창작물을 적극 장려합니다 >',
            'name': '이모티콘 봇',
            'isMe': false,
            'avatar': 'assets/images/c_avatar.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none'
          },
          {
            'type': 'text',
            'content': '와우 너무 잘생❣️❣️❣️',
            'name': '스마일리',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar12.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
            'country': 'KR'
          }
        ];
      else if (widget.itemData["title"].toString().contains("스마일보이 응원 총공") ||
          widget.itemData["title"].toString().contains("고독한 스마일보이"))
        msgList = [
          {
            'type': 'text',
            'content': '저도 하나 만들어봤는데 어때여??',
            'name': '페퍼민트',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'KR'
          },
          {
            'type': 'image_ad',
            'content': 'assets/images/tmp/ad_img4.png',
            'name': '페퍼민트',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'KR'
          },
          {
            'type': 'text',
            'content': '확인해보니까 텍스트나 초상권 없는 이미지 사용해야 된대용',
            'name': 'SMBOOO',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU'
          },
          {
            'type': 'image_ad',
            'content': 'assets/images/tmp/ad_img3.png',
            'name': 'SMBOOO',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU',
            'favCnt': 127
          },
          {
            'type': 'image_ad',
            'content': 'assets/images/tmp/ad_img2.png',
            'name': 'me',
            'isMe': true,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU',
            'favCnt': 127
          },
          {
            'type': 'text',
            'content': '우리 팬덤만의 이모티콘을 만들어 사용하세요!\n팬이 직접 만드는 창작물을 적극 장려합니다 >',
            'name': '이모티콘 봇',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar2.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
            'country': 'ES'
          },
          {
            'type': 'text',
            'content': '포카 정규2집 1번째 에디션 있을까요?',
            'name': 'me',
            'isMe': true,
            'avatar': 'assets/images/tmp/g_avatar12.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
            'country': 'KR'
          }
        ];
      else
        msgList = [
          {
            'type': 'image',
            'content': 'assets/images/tmp/g_img7.png',
            'name': 'SMBOOO',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU'
          },
          {
            'type': 'text',
            'content': '30 minutes left!! Looking forward to it🔥🔥🔥',
            'name': 'SMBOOO',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar7.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'AU'
          },
          {
            'type': 'text',
            'content': 'Aku tahu!!! Ayo jadikan peringkat pertama😎 Kita',
            'name': '스마일리',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'ES'
          },
          {
            'type': 'text',
            'content': 'Semuanya, chart musik album comeback segera hadir!',
            'name': '스마일리',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar5.png',
            'date': '',
            'time': '12:02pm',
            'status': 'none',
            'country': 'ES'
          },
          {
            'type': 'text',
            'content': 'こんにちは！嬉しい',
            'name': '페퍼민트',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar3.png',
            'date': '',
            'time': '12:01pm',
            'status': 'none',
            'country': 'JP'
          },
          {
            'type': 'text',
            'content': '안녕하세요😖',
            'name': 'me',
            'isMe': true,
            'avatar': 'assets/images/tmp/g_avatar2.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
            'country': 'KR'
          },
          {
            'type': 'text',
            'content': '스마일보이 자유 채팅방 방장 스마보러버입니당😊',
            'name': '스마보\n러버',
            'isMe': false,
            'avatar': 'assets/images/tmp/g_avatar2.png',
            'date': '',
            'time': '12:00pm',
            'status': 'none',
            'country': 'KR'
          }
        ];
    });
  }

  void onTranslate() {
    setState(() {
      msgList = [
        {
          'type': 'image',
          'content': 'assets/images/tmp/g_img7.png',
          'name': 'SMBOOO',
          'isMe': false,
          'avatar': 'assets/images/tmp/g_avatar7.png',
          'date': '',
          'time': '12:02pm',
          'status': 'none',
          'country': 'AU'
        },
        {
          'type': 'text',
          'content': '330분 남았네요!! 기대중🔥🔥🔥',
          'name': 'SMBOOO',
          'isMe': false,
          'avatar': 'assets/images/tmp/g_avatar7.png',
          'date': '',
          'time': '12:02pm',
          'status': 'none',
          'country': 'AU'
        },
        {
          'type': 'text',
          'content': '알죠!!! 1위 만들어요😎 우리',
          'name': '스마일리',
          'isMe': false,
          'avatar': 'assets/images/tmp/g_avatar5.png',
          'date': '',
          'time': '12:02pm',
          'status': 'none',
          'country': 'ES'
        },
        {
          'type': 'text',
          'content': '여러분 곧 컴백앨범 뮤직차트 ',
          'name': '스마일리',
          'isMe': false,
          'avatar': 'assets/images/tmp/g_avatar5.png',
          'date': '',
          'time': '12:02pm',
          'status': 'none',
          'country': 'ES'
        },
        {
          'type': 'text',
          'content': '안녕하세요! 반가워용',
          'name': '페퍼민트',
          'isMe': false,
          'avatar': 'assets/images/tmp/g_avatar3.png',
          'date': '',
          'time': '12:01pm',
          'status': 'none',
          'country': 'JP'
        },
        {
          'type': 'text',
          'content': '안녕하세요😖',
          'name': 'me',
          'isMe': true,
          'avatar': 'assets/images/tmp/g_avatar2.png',
          'date': '',
          'time': '12:00pm',
          'status': 'none',
          'country': 'KR'
        },
        {
          'type': 'text',
          'content': '스마일보이 자유 채팅방 방장 스마보러버입니당😊',
          'name': '스마보\n러버',
          'isMe': false,
          'avatar': 'assets/images/tmp/g_avatar2.png',
          'date': '',
          'time': '12:00pm',
          'status': 'none',
          'country': 'KR'
        }
      ];
    });
  }

  bool isFirstMsg(idx) {
    if (idx >= (msgList.length - 1)) {
      return true;
    }
    if (msgList[idx]["name"] != msgList[idx + 1]["name"]) {
      return true;
    }
    return false;
  }

  void addShareMsg() {
    var tList = msgList;
    if (tList[0]["type"] == "progress") {
      tList.removeAt(0);
    }
    tList.insert(0, {
      'type': 'share',
      'content': '',
      'name': 'me',
      'isMe': true,
      'avatar': '',
      'date': '',
      'time': '',
      'status': 'none'
    });
    setState(() {
      msgList = tList;
    });
  }

  void sendTextMessage(String text) {
    var tList = msgList;
    if (tList[0]["type"] == "progress") {
      tList.removeAt(0);
    }
    tList.insert(0, {
      'type': 'text',
      'content': "안녕 루미야! ❤️\n만나서 반가워. 오늘은 뭐해?",
      'name': 'CELEB',
      'isMe': false,
      'avatar': 'assets/images/tmp/g_avatar5.png',
      'date': '',
      'time': "3:40am",
      'status': 'active'
    });
    tList.insert(0, {
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
  }

  void addImgMessage(String path) {
    var tList = msgList;
    if (tList[0]["type"] == "progress") {
      tList.removeAt(0);
    }
    tList.insert(0, {
      'type': 'image',
      'content': "assets/images/tmp/g_img3.png",
      'name': 'CELEB',
      'isMe': false,
      'avatar': 'assets/images/c_avatar.png',
      'date': '',
      'time': getCurrentTimeString(),
      'status': 'none'
    });
    tList.insert(0, {
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
  }

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

  void _onBackspacePressed() {
    txtC
      ..text = txtC.text.characters.toString()
      ..selection =
          TextSelection.fromPosition(TextPosition(offset: txtC.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: true,
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
                                      reverse: true,
                                      padding: const EdgeInsets.all(0),
                                      itemCount: msgList.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (!msgList[index]["isMe"])
                                          return Container(
                                              padding: EdgeInsets.only(top: 8),
                                              child: OtherMsg(
                                                  msg: msgList[index],
                                                  isFirst: isFirstMsg(index),
                                                  idx: index,
                                                  callback: otherMsgClick));
                                        if (msgList[index]["isMe"])
                                          return Container(
                                              padding: EdgeInsets.only(top: 8),
                                              child: MyMsg(
                                                  msg: msgList[index],
                                                  isFirst: isFirstMsg(index),
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
                              padding:
                                  EdgeInsets.only(top: 8, left: 16, right: 16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                      onTap: () {
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
                                  Builder(builder: (context) {
                                    return GestureDetector(
                                        onTap: () {
                                          if (keyboardShown || emojiShowing) {
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
                                                      fontFamily: 'pretendard',
                                                      color: Color.fromRGBO(
                                                          0, 0, 0, 0.4)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20.0),
                                                    borderSide: BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1.0),
                                                  ),
                                                  suffixIcon: IconButton(
                                                      padding:
                                                          EdgeInsets.all(0),
                                                      icon: Container(
                                                        width: 30,
                                                        height: 30,
                                                        decoration: BoxDecoration(
                                                            color: isTranslating
                                                                ? Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        172,
                                                                        255,
                                                                        1)
                                                                : Colors
                                                                    .transparent,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        15)),
                                                        child: Center(
                                                            child: SizedBox(
                                                                width: 20,
                                                                height: 20,
                                                                child: Image.asset(
                                                                    isTranslating
                                                                        ? "assets/images/w_translate_icon.png"
                                                                        : "assets/images/b_translate_icon.png"))),
                                                      ),
                                                      onPressed: () {
                                                        if (isTranslating) {
                                                          setState(() {
                                                            isTranslating =
                                                                false;
                                                          });
                                                          getInitMsg();
                                                        } else {
                                                          setState(() {
                                                            isTranslating =
                                                                true;
                                                          });
                                                          onTranslate();
                                                        }
                                                      })),
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
                                      fontSize: 20, color: Colors.black26),
                                  textAlign: TextAlign.center,
                                ),
                                loadingIndicator: const SizedBox.shrink(),
                                tabIndicatorAnimDuration: kTabScrollDuration,
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
                          padding: EdgeInsets.only(left: 0, right: 0, top: 8),
                          child: Column(children: [
                            Container(
                              height: 30,
                              padding: EdgeInsets.only(left: 16, right: 16),
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
                                  title,
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
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 16, right: 16),
                                child: Scrollbar(
                                    thickness: 0.0,
                                    child: ListView.builder(
                                      padding:
                                          EdgeInsets.only(left: 0, right: 0),
                                      itemCount: tabNames.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                tabIdx = index;
                                              });
                                            },
                                            child: Container(
                                                padding:
                                                    EdgeInsets.only(right: 16),
                                                child: Container(
                                                    height: 30,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                      bottom: BorderSide(
                                                          width: 3,
                                                          color: tabIdx == index
                                                              ? Color.fromRGBO(
                                                                  0,
                                                                  172,
                                                                  255,
                                                                  1)
                                                              : Colors
                                                                  .transparent),
                                                    )),
                                                    child: Center(
                                                      child: Text(
                                                        tabNames[index],
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'pretendard',
                                                            color: tabIdx ==
                                                                    index
                                                                ? Color
                                                                    .fromRGBO(0,
                                                                        0, 0, 1)
                                                                : Color
                                                                    .fromRGBO(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        0.3),
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ))));
                                      },
                                      scrollDirection: Axis.horizontal,
                                    ))),
                            Divider(
                              thickness: 1,
                              height: 0,
                              indent: 0,
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                            )
                          ])))
                ],
              )),
        ));
  }

  void otherMsgClick(int idx, String type) {}
  //공유하기, 시작하기 등을 클릭 햇을 때
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
        msgList = tList;
      });
    } else if (type == "share_close") {
      setState(() {
        var tList = msgList;
        tList.removeAt(idx);
        msgList = tList;
      });
    } else if (type == "share_start") {
    } else if (type == "share_confirm") {
      setState(() {
        var tList = msgList;
        tList.removeAt(idx);
        msgList = tList;
      });
    }
  }
}
