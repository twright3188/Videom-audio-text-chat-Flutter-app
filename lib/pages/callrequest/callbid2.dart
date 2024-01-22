import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:crepe/ext/customroute.dart';
import 'package:crepe/pages/callrequest/callbid3.dart';
import 'dart:async';

//콜 요청 페이지 2(스타 옥션)
class CallBid2 extends StatefulWidget {
  const CallBid2({Key? key, required this.methodIdx}) : super(key: key);
  final int methodIdx;

  @override
  State<CallBid2> createState() => _CallBid2();
}

class _CallBid2 extends State<CallBid2> {
  var crepeCnt = 0;
  var timer;
  var totalTime = 3 * 3600;
  var hourT = "03";
  var minT = "00";
  var secT = "00";
  @override
  void initState() {
    super.initState();
    setTimer();
  }

  @override
  void dispose() {
    if (timer != null) timer.cancel();
    super.dispose();
  }

  void setTimer() {
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      if (timer.tick > 3 * 3600) {
        timer.cancel();
      } else {
        int remainT = totalTime - timer.tick;
        int hour = (remainT / 3600).floor();
        remainT = remainT - hour * 3600;
        int min = (remainT / 60).floor();
        int sec = remainT.floor() - 60 * min;

        setState(() {
          hourT = hour > 9 ? "$hour" : "0$hour";
          minT = min > 9 ? "$min" : "0$min";
          secT = sec > 9 ? "$sec" : "0$sec";
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: false,
          child: Container(
              child: Stack(children: [
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top + 8)),
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 30,
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 24,
                            height: 30,
                            child: Center(
                                child: SizedBox(
                              width: 24,
                              height: 24,
                              child: Image.asset("assets/images/back_icon.png"),
                            )),
                          )),
                      Spacer(),
                      Text(
                        '1:1 채팅권',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      Spacer(),
                      Container(
                        width: 24,
                        height: 24,
                      )
                    ])),
                Padding(padding: EdgeInsets.only(top: 16)),
                Container(
                  height: 351,
                  child:
                      Center(child: Image.asset("assets/images/bid2_back.png")),
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                Text(
                  'CELEB x 10분간 1:1 채팅권',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  '23. 05. 04 16:00',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Color.fromRGBO(0, 172, 255, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w800),
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 247, 253, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        hourT,
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                    Padding(padding: EdgeInsets.only(left: 4)),
                    Text(
                      ':',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(padding: EdgeInsets.only(left: 4)),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 247, 253, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        minT,
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                    Padding(padding: EdgeInsets.only(left: 4)),
                    Text(
                      ':',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(padding: EdgeInsets.only(left: 4)),
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(243, 247, 253, 1),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                        secT,
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      )),
                    ),
                    Spacer()
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                Row(
                  children: [
                    Spacer(),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            if (crepeCnt > 0) {
                              crepeCnt = crepeCnt - 1;
                            } else {
                              crepeCnt = 0;
                            }
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/images/minus_icon.png"),
                        )),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text(
                      '$crepeCnt crepe',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Color.fromRGBO(0, 172, 255, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            crepeCnt = crepeCnt + 1;
                          });
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/images/plus_icon.png"),
                        )),
                    Spacer()
                  ],
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Row(
                  children: [
                    Spacer(),
                    Text(
                      '나의 보유 크레페',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Padding(padding: EdgeInsets.only(left: 4)),
                    Container(
                        width: 16,
                        height: 16,
                        child: Image.asset("assets/images/b_heart_icon.png")),
                    Padding(padding: EdgeInsets.only(left: 4)),
                    Text(
                      '10,000',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                    Spacer()
                  ],
                )
              ],
            ),
            Positioned(
              bottom: 16,
              left: MediaQuery.of(context).size.width / 2 - 90,
              child: SizedBox(
                width: 180,
                height: 42,
                child: FilledButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          CreateRoute(CallBid3(methodIdx: widget.methodIdx)));
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 172, 255, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
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
            )
          ])),
        ));
  }
}
