import 'package:crepe/pages/callrequest/callbid2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:crepe/ext/customroute.dart';
import 'dart:async';
import 'dart:io' show Platform;

//콜 요청 페이지 1(스타 옥션)
class CallBid1 extends StatefulWidget {
  const CallBid1({Key? key, required this.methodIdx}) : super(key: key);
  final int methodIdx;
  @override
  State<CallBid1> createState() => _CallBid1();
}

class _CallBid1 extends State<CallBid1> {
  var selectedIdx = -1;
  var keyboardShown = false;
  var keyboardSubscription;
  List<Map<String, dynamic>> msgList = [];
  var msgText = "";
  var txtC = TextEditingController();
  final ScrollController scontroller = ScrollController();
  @override
  void initState() {
    super.initState();
    setState(() {
      //임시 메시지
      msgList = [
        {"name": "glueme", "text": "1빠 참여. 응~ 내가 가져갈거야", 'type': 'text'},
        {"name": "CELEB", "text": "여러분 안녕! 이따 만나요~", 'type': 'text'},
        {"name": "", "text": "assets/images/tmp/c_img1.png", 'type': 'image'},
        {"name": "멍냥부리", "text": "헉 오빠다!!!", 'type': 'text'},
        {"name": "냥냥이", "text": "보고싶어요 ❤️❤️❤️ 사랑해요", 'type': 'text'}
      ];
    });

    var keyboardVisibilityController = KeyboardVisibilityController();
    keyboardSubscription =
        keyboardVisibilityController.onChange.listen((bool visible) {
      setState(() {
        keyboardShown = visible;
      });
      moveToBottom();
    });

    moveToBottom();
  }

  @override
  void dispose() {
    keyboardSubscription.cancel();
    super.dispose();
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
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset("assets/images/bid1_back.png",
                              fit: BoxFit.cover)))),
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
                                            color: Color.fromRGBO(0, 0, 0, 0.5),
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
              Positioned(
                left: 24,
                top: MediaQuery.of(context).padding.top + 8 + 60,
                child: Container(
                    height: 24,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 29,
                          width: 60,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(251, 85, 76, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spacer(),
                                SizedBox(
                                  width: 12,
                                  height: 12,
                                  child: Image.asset(
                                      "assets/images/live_icon.png"),
                                ),
                                Padding(padding: EdgeInsets.only(left: 4)),
                                Text(
                                  'LIVE',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700),
                                ),
                                Spacer()
                              ]),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8, right: 12),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 14,
                                height: 14,
                                child: Image.asset(
                                    "assets/images/groups_icon.png"),
                              ),
                              Container(
                                width: 4,
                              ),
                              Text(
                                '234명 참여중',
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
              Column(
                children: [
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 282,
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    padding: EdgeInsets.all(16),
                    child: Column(children: [
                      Container(
                        height: 20,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("glueme님, 경매가 곧 시작됩니다",
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
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              itemCount: msgList.length,
                              controller: scontroller,
                              itemBuilder: (BuildContext context, int index) {
                                if (msgList[index]["type"] == 'image') {
                                  return Container(
                                      color: Colors.transparent,
                                      child: Row(
                                        children: [
                                          Spacer(),
                                          Container(
                                              height: 82,
                                              child: Image.asset(
                                                  msgList[index]["text"],
                                                  fit: BoxFit.fitHeight)),
                                          Spacer()
                                        ],
                                      ));
                                }
                                return Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        Text(msgList[index]["name"].toString(),
                                            style: TextStyle(
                                                fontFamily: 'pretendard',
                                                color: Color.fromRGBO(
                                                    138, 235, 239, 1),
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500)),
                                        Padding(
                                            padding: EdgeInsets.only(left: 6)),
                                        Text(msgList[index]["text"].toString(),
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
                      ),
                      Container(
                        height: 80,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 1,
                                color: Color.fromRGBO(255, 255, 255, 0.7),
                              ),
                              Padding(padding: EdgeInsets.only(top: 8)),
                              Text("[ 23. 05. 04 ] CELEB x 10분간 1:1 채팅권",
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500)),
                              Padding(padding: EdgeInsets.only(top: 8)),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 267,
                                    height: 42,
                                    child: FilledButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              CreateRoute(CallBid2(
                                                  methodIdx:
                                                      widget.methodIdx)));
                                        },
                                        style: FilledButton.styleFrom(
                                            backgroundColor:
                                                Color.fromRGBO(0, 172, 255, 1),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 0)),
                                        child: Center(
                                            child: Text(
                                          '입찰하기',
                                          style: TextStyle(
                                              fontFamily: 'pretendard',
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600),
                                        ))),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 16)),
                                  Text("00:12",
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          color: Color.fromRGBO(
                                              255, 255, 255, 0.7),
                                          fontSize: 13,
                                          fontWeight: FontWeight.w500))
                                ],
                              )
                            ]),
                      )
                    ]),
                  ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 74,
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                      child: Container(
                          padding: EdgeInsets.only(top: 8, left: 16, right: 16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (!keyboardShown)
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
                                              "assets/images/add_circle_icon.png"),
                                        )))),
                              if (!keyboardShown)
                                Padding(padding: EdgeInsets.only(left: 10)),
                              GestureDetector(
                                  onTap: () {
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
                                      child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            filled: true,
                                            contentPadding: EdgeInsets.only(
                                                top: 14, left: 16, right: 10),
                                            fillColor: Color.fromRGBO(
                                                255, 255, 255, 0.3),
                                            hintText: "채팅을 입력하세요.",
                                            hintStyle: TextStyle(
                                                fontFamily: 'pretendard',
                                                color: Color.fromRGBO(
                                                    255, 255, 255, 0.6)),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20.0),
                                              borderSide: BorderSide(
                                                  color: Colors.transparent,
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
                                          })))
                            ],
                          ))),
                  if (Platform.isIOS)
                    Container(
                      height: 16,
                      color: Color.fromRGBO(0, 0, 0, 0.8),
                    )
                ],
              )
            ],
          )),
        ));
  }
}
