import 'package:crepe/Variables/GlobalVar.dart';
import 'package:crepe/pages/cellerbroom/chatmessage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:crepe/ext/customroute.dart';

class ChatBid3 extends StatefulWidget {
  const ChatBid3({Key? key, required this.methodIdx}) : super(key: key);
  final int methodIdx;
  @override
  State<ChatBid3> createState() => _ChatBid3();
}

class _ChatBid3 extends State<ChatBid3> {
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
                      Spacer(),
                      Text(
                        '낙찰 완료',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      Spacer()
                    ])),
                Padding(padding: EdgeInsets.only(top: 120)),
                Container(
                  width: 48,
                  height: 48,
                  child: Image.asset("assets/images/biddone_icon.png"),
                ),
                Padding(padding: EdgeInsets.only(top: 24)),
                Text(
                  '축하합니다!',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  '최고가로 스타옥션 낙찰이',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                Text(
                  '완료되었습니다.',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Padding(padding: EdgeInsets.only(top: 16)),
                Container(
                    padding: EdgeInsets.only(left: 40, right: 40),
                    child: Container(
                      height: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    )),
                Padding(padding: EdgeInsets.only(top: 16)),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child: Wrap(
                    children: [
                      Text(
                        '스타옥션을 신청하여 리워드로 ',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '1 엔젤 크레페가 적립',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Color.fromRGBO(0, 172, 255, 1),
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                      Text(
                        '되었습니다.',
                        style: TextStyle(
                            fontFamily: 'pretendard',
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 32)),
                Text(
                  '-> 신청 현황은 마이페이지에서\n     확인하실 수 있습니다.',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  height: 70,
                ),
                Spacer()
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
                      var count = 0;
                      Navigator.popUntil(context, (route) {
                        isChatRequested = true;
                        count++;
                        if (count == 5) {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => const ChatMessage()));
                          return true;
                        } else {
                          return false;
                        }
                      });
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Color.fromRGBO(0, 172, 255, 1),
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
                    child: Center(
                        child: Text(
                      '확인',
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
