import 'package:crepe/Variables/GlobalVar.dart';
import 'package:crepe/pages/callrequest/callmethod.dart';
import 'package:crepe/pages/cellerbroom/chatcall.dart';
import 'package:crepe/pages/cellerbroom/chatmessage.dart';
import 'package:crepe/pages/chatrequest/chatmethod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:crepe/ext/customroute.dart';
import 'dart:async';
import 'dart:io' show Platform;

//콜과 채팅을 선택하는 페이지 ....
class CellerbChat extends StatefulWidget {
  const CellerbChat({Key? key}) : super(key: key);
  @override
  State<CellerbChat> createState() => _CellerbChat();
}

class _CellerbChat extends State<CellerbChat> {
  var selectedIdx = -1;
  var keyboardShown = false;
  var keyboardSubscription;
  //초기 메시지
  List<Map<String, dynamic>> msgList = [
    {"name": "hypeboy", "text": "ㅎㅎㅎ"},
    {"name": "glueme", "text": "지금 무슨 노래를 들으세요?"}
  ];
  var msgText = "";
  var txtC = TextEditingController();
  final ScrollController scontroller = ScrollController();
  //알림 표시 및 형태를 위해 설정
  var notiIdx = -1;

  @override
  void initState() {
    super.initState();
    isCallRequested = false;
    isChatRequested = false;

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

  @override
  void dispose() {
    keyboardSubscription.cancel();
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
              Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                      padding: EdgeInsets.zero,
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Image.asset("assets/images/cellroom_back.png",
                              fit: BoxFit.fill)))),
              Positioned(
                  left: 0,
                  top: MediaQuery.of(context).padding.top + 8,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 38,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(children: [
                      SizedBox(
                        width: 38,
                        height: 38,
                        child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                                side: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0)),
                            child: Center(
                                child: SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset("assets/images/menu_icon.png"),
                            ))),
                      ),
                      Spacer(),
                      SizedBox(
                        width: 38,
                        height: 38,
                        child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                                side: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0)),
                            child: Center(
                                child: SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset(
                                  "assets/images/w_bell_icon_on.png"),
                            ))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      SizedBox(
                        width: 38,
                        height: 38,
                        child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 0, 0, 0.6),
                                side: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0)),
                            child: Center(
                                child: SizedBox(
                              width: 28,
                              height: 28,
                              child:
                                  Image.asset("assets/images/mission_icon.png"),
                            ))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      SizedBox(
                        width: 38,
                        height: 38,
                        child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(131, 54, 54, 0.6),
                                side: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 0, 0, 0.6),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0)),
                            child: Center(
                                child: SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset("assets/images/feed_icon.png"),
                            ))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      SizedBox(
                        width: 38,
                        height: 38,
                        child: FilledButton(
                            onPressed: () {},
                            style: FilledButton.styleFrom(
                                backgroundColor:
                                    Color.fromRGBO(239, 241, 254, 1),
                                side: BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(0, 172, 255, 1),
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0)),
                            child: Center(
                                child: SizedBox(
                              width: 38,
                              height: 38,
                              child: Image.asset(
                                  "assets/images/tmp/g_avatar5.png"),
                            ))),
                      )
                    ]),
                  )),
              Column(
                children: [
                  Spacer(),
                  if (!keyboardShown)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 42,
                      padding: EdgeInsets.only(left: 16, right: 16, bottom: 0),
                      child: Row(children: [
                        SizedBox(
                          width: 42,
                          height: 42,
                          child: FilledButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              style: FilledButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(255, 255, 255, 0.6),
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0)),
                              child: Center(
                                  child: SizedBox(
                                width: 28,
                                height: 28,
                                child: Image.asset(
                                    "assets/images/arrow_left_grey_icon.png"),
                              ))),
                        ),
                        Spacer(),
                        SizedBox(
                          width: 72,
                          height: 42,
                          child: FilledButton(
                              onPressed: () {
                                if (isCallRequested) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChatCall(isIncoming: true)));
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CallMethod(),
                                    ),
                                  ).then((_) {
                                    setState(() {
                                      notiIdx = isCallRequested ? 1 : -1;
                                    });
                                  });
                                }
                              },
                              style: FilledButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(255, 255, 255, 0.6),
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0)),
                              child: Center(
                                  child: Text("Call",
                                      style: TextStyle(
                                          fontFamily: 'gmarketsans',
                                          color: Color.fromRGBO(0, 172, 255, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)))),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        SizedBox(
                          width: 72,
                          height: 42,
                          child: FilledButton(
                              onPressed: () {
                                if (isChatRequested) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const ChatMessage()));
                                } else {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ChatMethod(),
                                    ),
                                  ).then((_) {
                                    setState(() {
                                      notiIdx = isChatRequested ? 2 : -1;
                                    });
                                  });
                                }
                              },
                              style: FilledButton.styleFrom(
                                  backgroundColor:
                                      Color.fromRGBO(255, 255, 255, 0.6),
                                  side: BorderSide(
                                    width: 1,
                                    color: Colors.transparent,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 0)),
                              child: Center(
                                  child: Text("Chat",
                                      style: TextStyle(
                                          fontFamily: 'gmarketsans',
                                          color: Color.fromRGBO(0, 172, 255, 1),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)))),
                        ),
                        Spacer(),
                        SizedBox(width: 42, height: 42)
                      ]),
                    ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  Container(
                      padding: EdgeInsets.zero,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromRGBO(0, 172, 255, 1),
                            Color.fromRGBO(84, 220, 244, 1),
                          ],
                        ),
                      ),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 54,
                          child: Center(
                              child: Text("PRIVATE LIVE OPEN 2023",
                                  style: TextStyle(
                                      fontFamily: 'ppmonument',
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w900))))),
                  if (keyboardShown)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 132,
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
                  if (keyboardShown)
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 1,
                      color: Color.fromRGBO(0, 172, 255, 1),
                    ),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      height: 74,
                      color: Color.fromRGBO(0, 0, 0, 0.7),
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
                      color: Color.fromRGBO(0, 0, 0, 0.7),
                    )
                ],
              ),
              AnimatedPositioned(
                  left: MediaQuery.of(context).size.width / 2 - 300 / 2,
                  //  top: 140,
                  top: notiIdx == -1 ? -150.0 : 150.0,
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastOutSlowIn,
                  child: GestureDetector(
                      onTap: () {
                        if (notiIdx == 1) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChatCall(isIncoming: true))).then((_) {
                            setState(() {
                              notiIdx = -1;
                            });
                          });
                        } else if (notiIdx == 2) {
                          Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatMessage()))
                              .then((_) {
                            setState(() {
                              notiIdx = -1;
                            });
                          });
                        }
                      },
                      child: Container(
                          width: 300,
                          //  height: 93,
                          padding: EdgeInsets.only(
                              left: 16, right: 16, top: 8, bottom: 8),
                          decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 0, 0, 0.6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Row(children: [
                                Column(children: [
                                  Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Center(
                                          child: SizedBox(
                                        width: 26,
                                        height: 20,
                                        child: Image.asset(
                                            "assets/images/b_heart_icon.png",
                                            fit: BoxFit.cover),
                                      ))),
                                  Text("Crepe",
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500))
                                ]),
                                Padding(padding: EdgeInsets.only(left: 8)),
                                Container(
                                    width: 292 - 32 - 40 - 8,
                                    child: Text(
                                        notiIdx == 1
                                            ? "[ 프라이빗 콜 X CELEB ]\n루미님, 오늘 오후 7시에 만나요 ♥"
                                            : "[ 프라이빗 채팅 X CELEB ]\n루미님, 오늘 오후 3시에 만나요 ♥",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                            fontFamily: 'pretendard',
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700)))
                              ]),
                              Row(children: [
                                Spacer(),
                                Text("1분전",
                                    style: TextStyle(
                                        fontFamily: 'pretendard',
                                        color: Colors.white.withOpacity(0.6),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500))
                              ])
                            ],
                          ))))
            ],
          )),
        ));
  }
}
