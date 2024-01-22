import 'package:flutter/material.dart';
import 'package:crepe/ext/customroute.dart';
import 'package:crepe/pages/chatrequest/chatbid33.dart';

class ChatBid22 extends StatefulWidget {
  const ChatBid22({Key? key, required this.methodIdx}) : super(key: key);
  final int methodIdx;
  @override
  State<ChatBid22> createState() => _ChatBid22();
}

class _ChatBid22 extends State<ChatBid22> {
  var crepeCnt = 0;
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
                        '구매하기',
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
                Padding(padding: EdgeInsets.only(top: 16)),
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Container(
                        padding: EdgeInsets.only(left: 16, right: 16),
                        width: MediaQuery.of(context).size.width - 32,
                        height: 63,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color.fromRGBO(243, 247, 253, 1)),
                        child: Center(
                            child: Text(
                          '4월 10일 결과가 공개되며, 미션 참여 지수가\n높은 팬 리스트 중 랜덤 추첨을 통해 당첨됩니다.',
                          style: TextStyle(
                              fontFamily: 'pretendard',
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        )))),
                Padding(padding: EdgeInsets.only(top: 32)),
                Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Center(
                                child: Column(
                          children: [
                            Text(
                              '참여 현황',
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              '234명 참여중',
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  color: Color.fromRGBO(0, 172, 255, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ))),
                        Container(
                          width: 1,
                          height: 30,
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                        ),
                        Expanded(
                            child: Center(
                                child: Column(
                          children: [
                            Text(
                              '나의 보유 크레페',
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(children: [
                              Spacer(),
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: Image.asset(
                                    "assets/images/b_heart_icon.png"),
                              ),
                              Padding(padding: EdgeInsets.only(left: 4)),
                              Text(
                                '10,000',
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                              Spacer(),
                            ])
                          ],
                        )))
                      ],
                    )),
                Padding(padding: EdgeInsets.only(top: 16)),
                Text(
                  '3 crepe',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Color.fromRGBO(0, 172, 255, 1),
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
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
                          CreateRoute(ChatBid33(methodIdx: widget.methodIdx)));
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 172, 255, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                    child: Center(
                        child: Text(
                      '구매하기',
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
