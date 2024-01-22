import 'package:crepe/pages/chatrequest/chatbid2.dart';
import 'package:flutter/material.dart';
import 'package:crepe/ext/customroute.dart';

class ChatBid1 extends StatefulWidget {
  const ChatBid1({Key? key, required this.methodIdx}) : super(key: key);
  final int methodIdx;
  @override
  State<ChatBid1> createState() => _ChatBid1();
}

class _ChatBid1 extends State<ChatBid1> {
  List<Map<String, dynamic>> memberList = [];
  @override
  void initState() {
    super.initState();
    getInitData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getInitData() {
    setState(() {
      memberList = [
        {
          'name': '명냥부리',
          'avatar': 'assets/images/tmp/g_avatar4.png',
          'datetime': '23.03.27 22:03 pm'
        },
        {
          'name': '냥냥이97',
          'avatar': 'assets/images/tmp/g_avatar5.png',
          'datetime': '23.03.27 21:49 pm'
        },
        {
          'name': '솜솜이',
          'avatar': 'assets/images/tmp/g_avatar6.png',
          'datetime': '23.03.27 21:49 pm'
        },
        {
          'name': '냥냥이111',
          'avatar': 'assets/images/tmp/g_avatar1.png',
          'datetime': '23.03.27 21:49 pm'
        },
        {
          'name': '솜솜이0000',
          'avatar': 'assets/images/tmp/g_avatar2.png',
          'datetime': '23.03.27 21:49 pm'
        },
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
          top: false,
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
                          height: 351,
                          child: Image.asset("assets/images/chatbid1_back.png",
                              fit: BoxFit.fill)))),
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
                              child: Image.asset("assets/images/back_icon.png"),
                            )),
                          )),
                      Spacer(),
                      Text(
                        '프라이빗 채팅 경매',
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
              ),
              Positioned(
                left: 0,
                top: 341,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 341,
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Center(
                          child: Container(
                        width: 60,
                        height: 6,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Color.fromRGBO(0, 0, 0, 0.2)),
                      )),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      Text(
                        '[ 23. 05. 04 ] CELEB x 10분간 1:1 채팅권',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        '크리에이터',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(children: [
                              Container(
                                width: 42,
                                height: 42,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(21),
                                    border: Border.all(
                                        width: 1,
                                        color: Color.fromRGBO(0, 0, 0, 0.1))),
                                child: Image.asset(
                                    "assets/images/tmp/tmp_avatar1.png"),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 4),
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
                            Spacer(),
                            Column(
                              children: [
                                SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: Image.asset(
                                      "assets/images/g_heart_icon.png"),
                                ),
                                Text(
                                  '12,345',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Color.fromRGBO(0, 0, 0, 0.5),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            )
                          ]),
                      Padding(padding: EdgeInsets.only(top: 16)),
                      Container(
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Container(
                            height: 48,
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(243, 247, 253, 1),
                                borderRadius: BorderRadius.circular(8)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Spacer(),
                                Text(
                                  '1,270',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '\n명 참여중',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(padding: EdgeInsets.only(left: 32)),
                                Container(
                                  width: 1,
                                  height: 30,
                                  color: Color.fromRGBO(7, 6, 6, 0.498),
                                ),
                                Padding(padding: EdgeInsets.only(left: 32)),
                                Text(
                                  '7.3',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '\n시간 남음',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer()
                              ],
                            ),
                          )),
                      Padding(padding: EdgeInsets.only(top: 16)),
                      Text(
                        '현재 참여중인 팬',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w700),
                      ),
                      Padding(padding: EdgeInsets.only(top: 16)),
                      Expanded(
                          flex: 1,
                          child: Scrollbar(
                              thickness: 0.0,
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: memberList.length,
                                itemBuilder: (BuildContext context, int i) {
                                  return GestureDetector(
                                      onTap: () {},
                                      child: Container(
                                        height: 64,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                                width: 40,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        width: 1,
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 1))),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22.5),
                                                  child: Image.asset(
                                                      memberList[i]["avatar"]
                                                          .toString()),
                                                )),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8, top: 0),
                                            ),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    memberList[i]["name"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  Text(
                                                    memberList[i]["datetime"]
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.6),
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 12),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    // softWrap: true
                                                  )
                                                ])
                                          ],
                                        ),
                                      ));
                                },
                                scrollDirection: Axis.vertical,
                              ))),
                      Padding(padding: EdgeInsets.only(top: 16)),
                    ],
                  ),
                ),
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
                            CreateRoute(ChatBid2(methodIdx: widget.methodIdx)));
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
            ],
          )),
        ));
  }
}
