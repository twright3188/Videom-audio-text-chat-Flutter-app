import 'package:crepe/pages/callrequest/callbid1.dart';
import 'package:crepe/pages/callrequest/callbid22.dart';
import 'package:flutter/material.dart';
import 'package:crepe/ext/customroute.dart';

class CallMethod extends StatefulWidget {
  const CallMethod({Key? key}) : super(key: key);
  @override
  State<CallMethod> createState() => _CallMethod();
}

class _CallMethod extends State<CallMethod> {
  var methodIdx = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 420,
                  color: Color.fromRGBO(243, 247, 253, 1),
                  child: Stack(children: [
                    Positioned(
                      bottom: 0,
                      left: MediaQuery.of(context).size.width / 2 - 231 / 2,
                      child: Container(
                        width: 230,
                        height: 309,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 12,
                                  color: Color.fromRGBO(0, 0, 0, 0.2))
                            ]),
                        child: Image.asset("assets/images/callmode_back.png"),
                      ),
                    ),
                    Positioned(
                        bottom: 249,
                        left: MediaQuery.of(context).size.width / 2 - 231 / 2,
                        child: Container(
                          height: 38,
                          padding: EdgeInsets.only(left: 24, right: 24),
                          child: Row(children: [
                            SizedBox(
                              width: 28,
                              height: 28,
                              child: Image.asset(
                                  "assets/images/tmp/tmp_avatar1.png"),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'CELEB',
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          color: Colors.black,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700),
                                    ),
                                    Text(
                                      '02.24 03:36',
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          color: Colors.black,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 8),
                                    )
                                  ]),
                            )
                          ]),
                        )),
                    Positioned(
                      top: MediaQuery.of(context).padding.top + 8,
                      left: 0,
                      child: Container(
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
                                    child: Image.asset(
                                        "assets/images/back_icon.png"),
                                  )),
                                )),
                            Spacer(),
                            Text(
                              '프라이빗 콜 신청',
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
                    )
                  ]),
                ),
                Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        // Spacer(),
                        Padding(padding: EdgeInsets.only(top: 32)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              methodIdx = 0;
                            });
                          },
                          child: Container(
                              height: 154,
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 0, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 22,
                                        height: 22,
                                        child: Image.asset(methodIdx == 0
                                            ? "assets/images/check_circle_icon.png"
                                            : "assets/images/uncheck_circle_icon.png"),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 8)),
                                      Text(
                                        '스타 옥션',
                                        style: TextStyle(
                                            fontFamily: 'pretendard',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 8)),
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 12,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1))
                                        ]),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 125,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: methodIdx == 0
                                                ? Color.fromRGBO(
                                                    0, 172, 255, 0.5)
                                                : Color.fromRGBO(0, 0, 0, 0.5),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft:
                                                    Radius.circular(12)),
                                          ),
                                          child: SizedBox(
                                            width: 125,
                                            height: 119,
                                            child: Image.asset(
                                                "assets/images/method1_img.png"),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Spacer(),
                                                  Text(
                                                    '스타 옥션',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    '입찰가',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: methodIdx == 0
                                                            ? Color.fromRGBO(
                                                                0, 172, 255, 1)
                                                            : Color.fromRGBO(
                                                                0, 0, 0, 0.5),
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    '24시간 내 최종 낙찰자는 누구?',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.8),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Spacer()
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Padding(padding: EdgeInsets.only(top: 16)),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              methodIdx = 1;
                            });
                          },
                          child: Container(
                              height: 154,
                              padding: EdgeInsets.only(
                                  left: 16, right: 16, top: 0, bottom: 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 22,
                                        height: 22,
                                        child: Image.asset(methodIdx == 1
                                            ? "assets/images/check_circle_icon.png"
                                            : "assets/images/uncheck_circle_icon.png"),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 8)),
                                      Text(
                                        '럭키드로우',
                                        style: TextStyle(
                                            fontFamily: 'pretendard',
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      )
                                    ],
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 8)),
                                  Container(
                                    height: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 12,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.1))
                                        ]),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 125,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            color: methodIdx == 1
                                                ? Color.fromRGBO(
                                                    0, 172, 255, 0.5)
                                                : Color.fromRGBO(0, 0, 0, 0.5),
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(12),
                                                bottomLeft:
                                                    Radius.circular(12)),
                                          ),
                                          child: SizedBox(
                                            width: 125,
                                            height: 119,
                                            child: Image.asset(
                                                "assets/images/method2_img.png"),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 1,
                                          child: Container(
                                            padding: EdgeInsets.all(16),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Spacer(),
                                                  Text(
                                                    '럭키드로우',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    '3 crepe',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: methodIdx == 1
                                                            ? Color.fromRGBO(
                                                                0, 172, 255, 1)
                                                            : Color.fromRGBO(
                                                                0, 0, 0, 0.5),
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    '미션을 수행하여 당첨기회 UP!',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.8),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  Spacer()
                                                ]),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        ),
                        Spacer()
                      ],
                    )),
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
                      if (methodIdx == 0) {
                        Navigator.of(context)
                            .push(CreateRoute(CallBid1(methodIdx: methodIdx)));
                      } else if (methodIdx == 1) {
                        Navigator.of(context)
                            .push(CreateRoute(CallBid22(methodIdx: methodIdx)));
                      }
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 172, 255, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                    child: Center(
                        child: Text(
                      '참여하기',
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
