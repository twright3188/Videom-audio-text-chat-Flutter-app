import 'package:crepe/pages/callrequest/callmethod.dart';
import 'package:crepe/pages/cellerbroom/callincome.dart';
import 'package:crepe/pages/cellerbroom/callout.dart';
import 'package:crepe/pages/chatrequest/chatmethod.dart';
import 'package:crepe/pages/review/reviewmain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:crepe/ext/customroute.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'dart:io' show Platform;

//콜 채팅을 보여주는 페이지
class ChatCall extends StatefulWidget {
  const ChatCall({Key? key, required this.isIncoming}) : super(key: key);

  final bool isIncoming;

  @override
  State<ChatCall> createState() => _ChatCall();
}

class _ChatCall extends State<ChatCall> {
  var selectedIdx = -1;
  late CameraController controller;
  var camera_inited = false;

  late CameraController controller1;
  var camera_inited1 = false;

  var keyboardShown = false;
  var keyboardSubscription;
  //초기 메시지
  List<Map<String, dynamic>> msgList = [
    {"name": "hypeboy", "text": "ㅎㅎㅎ"},
    {"name": "glueme", "text": "지금 무슨 노래를 들으세요?"}
  ];
  var msgText = "";
  var txtC = TextEditingController();

  var isPreview = true;
  var isConnected = false;
  var isIncomingShow = false;

  var isTimeOut = false;
  var isSharing = false;
  final ScrollController scontroller = ScrollController();

  @override
  void initState() {
    super.initState();
    initCamera();
    if (!widget.isIncoming) {
      setState(() {
        isPreview = true;
        isIncomingShow = false;
      });
      Timer(
          Duration(seconds: 10),
          () => setState(() {
                isPreview = false;
                isConnected = true;
              }));
    } else {
      Timer(
          Duration(seconds: 10),
          () => setState(() {
                isPreview = false;
                isConnected = true;
                isIncomingShow = true;
              }));
    }
    //1분후에 시간초과(현재 20초)를 설정한다. 현재 임시로 타임머 이용

    Timer(
        Duration(seconds: 30),
        () => setState(() {
              isTimeOut = true;
            }));

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        keyboardShown = visible;
      });
      moveToBottom();
    });
  }

  void moveScroll() {
    scontroller.animateTo(
      scontroller.position.maxScrollExtent,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void moveToBottom() {
    Timer(Duration(milliseconds: 300), () => moveScroll());
  }

  void initCamera() async {
    List<CameraDescription> cameras = await availableCameras();

    controller = CameraController(cameras[1], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        camera_inited = true;
      });
    });
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: false,
          bottom: !Platform.isIOS,
          child: Container(
              child: Stack(
            children: [
              if (camera_inited)
                Positioned(
                    left: 0,
                    top: 0,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: isPreview
                        ? AspectRatio(
                            aspectRatio: 1,
                            child: CameraPreview(controller),
                          )
                        : Image.asset("assets/images/tmp/c_img3.png",
                            fit: BoxFit.cover)),
              if (camera_inited && isConnected)
                Positioned(
                    right: 20,
                    top: 140,
                    width: 90,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: AspectRatio(
                        aspectRatio: 1,
                        child: CameraPreview(controller),
                      ),
                    )),
              if (!isTimeOut)
                Positioned(
                    left: 0,
                    top: MediaQuery.of(context).padding.top + 8,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 60,
                              child: Row(children: [
                                SizedBox(
                                  width: 52,
                                  height: 52,
                                  child: Image.asset(
                                      "assets/images/tmp/tmp_avatar1.png"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 4, top: 8),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'CELEB',
                                          style: TextStyle(
                                              fontFamily: 'pretendard',
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text(
                                          '02.24 03:36',
                                          style: TextStyle(
                                              fontFamily: 'pretendard',
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.5),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        )
                                      ]),
                                )
                              ]),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                      "assets/images/b_close_icon.png")),
                            )
                          ]),
                    )),
              if (isPreview)
                Positioned(
                  left: MediaQuery.of(context).size.width / 2 - 145,
                  top: MediaQuery.of(context).size.height / 2 - 65,
                  child: Container(
                    width: 290,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "화면을 보고 미리 셀럽에게\n보여질 내 모습을 확인하세요!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              Column(
                children: [
                  Spacer(),
                  Container(
                    padding: EdgeInsets.only(left: 0, right: 16),
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 76,
                      height: 31,
                      child: Image.asset("assets/images/recordtotext_icon.png"),
                    ),
                  ),
                  if (isConnected) Padding(padding: EdgeInsets.only(top: 8)),
                  if (isConnected)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 134,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                      padding: EdgeInsets.all(16),
                      child: Column(children: [
                        Container(
                          height: 20,
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                    "glueme님, CELEB's Room에 오신 것을 환영합니다! (CH.1)",
                                    style: TextStyle(
                                        fontFamily: 'pretendard',
                                        color: Color.fromRGBO(235, 255, 84, 1),
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500)),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      child: Center(
                                          child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: Image.asset(
                                            "assets/images/close_icon.png"),
                                      )),
                                    )),
                              ]),
                        ),
                        Expanded(
                          flex: 1,
                          child: Scrollbar(
                              thickness: 0.0, // 스크롤 너비
                              // isAlwaysShown: true, // 항상 보이기 여부

                              child: ListView.builder(
                                reverse: false,
                                padding: const EdgeInsets.all(0),
                                itemCount: msgList.length,
                                controller: scontroller,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          Text(
                                              msgList[index]["name"].toString(),
                                              style: TextStyle(
                                                  fontFamily: 'pretendard',
                                                  color: Color.fromRGBO(
                                                      138, 235, 239, 1),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 6)),
                                          Text(
                                              msgList[index]["text"].toString(),
                                              style: TextStyle(
                                                  fontFamily: 'pretendard',
                                                  color: Color.fromRGBO(
                                                      255, 255, 255, 1),
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w500))
                                        ],
                                      ));
                                },
                                scrollDirection: Axis.vertical,
                              )),
                        )
                      ]),
                    ),
                  if (isConnected)
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: 74,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        child: Container(
                            padding:
                                EdgeInsets.only(top: 8, left: 16, right: 16),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                if (!keyboardShown)
                                  GestureDetector(
                                      onTap: () {
                                        if (!isConnected) return;
                                      },
                                      child: Container(
                                          width: 30,
                                          height: 30,
                                          child: Center(
                                              child: SizedBox(
                                            width: 24,
                                            height: 24,
                                            child: Image.asset(
                                                "assets/images/add_circle_icon.png"),
                                          )))),
                                if (!keyboardShown)
                                  Padding(padding: EdgeInsets.only(left: 10)),
                                GestureDetector(
                                    onTap: () {
                                      if (!isConnected) return;
                                      if (keyboardShown) {
                                        if (msgText.isNotEmpty) {
                                          var tList = msgList;
                                          tList.add({
                                            "name": "hypeboy",
                                            "text": msgText
                                          });
                                          tList.add({
                                            "name": "glueme",
                                            "text": "답글입니다. 지금 무슨 노래를 들으세요?"
                                          });
                                          setState(() {
                                            msgList = tList;
                                            txtC.text = "";
                                          });
                                          moveToBottom();
                                        }
                                      } else {}
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      child: Center(
                                          child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: Image.asset(keyboardShown
                                            ? "assets/images/arrow_right_icon.png"
                                            : "assets/images/msg_icon.png"),
                                      )),
                                    )),
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 40,
                                        padding:
                                            EdgeInsets.only(left: 8, right: 8),
                                        child: !isTimeOut
                                            ? TextField(
                                                readOnly: !isConnected,
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
                                                      255, 255, 255, 0.3),
                                                  hintText: "채팅을 입력하세요.",
                                                  hintStyle: TextStyle(
                                                      fontFamily: 'pretendard',
                                                      color: Color.fromRGBO(
                                                          255, 255, 255, 0.6)),
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
                                                ),
                                                style: TextStyle(
                                                    fontFamily: 'pretendard',
                                                    height: 1,
                                                    fontSize: 14,
                                                    decorationThickness: 0.0,
                                                    color: Colors.white),
                                                controller: txtC,
                                                onChanged: (text) {
                                                  setState(() {
                                                    msgText = text;
                                                  });
                                                })
                                            : Center(
                                                child: Text(
                                                "시간 초과로 더 이상 메세지를 달 수 없습니다.",
                                                style: TextStyle(
                                                    fontFamily: 'pretendard',
                                                    color: Colors.white,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ))))
                              ],
                            ))),
                  if (Platform.isIOS && isConnected)
                    Container(
                      height: 16,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    )
                ],
              ),
              if (isIncomingShow)
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CallIncome(callback: onAnswerofIncome),
                  ),
                ),
              if (isTimeOut)
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CallOut(callback: onShareItemClicked),
                  ),
                )
            ],
          )),
        ));
  }

  void onAnswerofIncome(bool isAnswer) {
    setState(() {
      isIncomingShow = false;
    });
  }

  void onShareItemClicked(String type) {
    if (type == "sharemodal_close") {
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
