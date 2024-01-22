import 'package:flutter/material.dart';

class FeedTabbar extends StatefulWidget {
  const FeedTabbar({Key? key, required this.callback}) : super(key: key);
  final Function(int) callback;
  @override
  State<FeedTabbar> createState() => _FeedTabbar();
}

class _FeedTabbar extends State<FeedTabbar> {
  var selectedIdx = 0;
  var tabNames = ['덕질 자랑', '챌린지', '팬레터'];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                widget.callback(0);
                setState(() {
                  selectedIdx = 0;
                });
              },
              child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                        width: 3,
                        color: selectedIdx == 0
                            ? Color.fromRGBO(0, 172, 255, 1)
                            : Colors.transparent),
                  )),
                  child: Center(
                    child: Text(
                      "덕질 자랑",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: selectedIdx == 0
                              ? Color.fromRGBO(0, 0, 0, 1)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ))),
          Padding(padding: EdgeInsets.only(left: 16)),
          GestureDetector(
              onTap: () {
                widget.callback(1);
                setState(() {
                  selectedIdx = 1;
                });
              },
              child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                        width: 3,
                        color: selectedIdx == 1
                            ? Color.fromRGBO(0, 172, 255, 1)
                            : Colors.transparent),
                  )),
                  child: Center(
                    child: Text(
                      "챌린지",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: selectedIdx == 1
                              ? Color.fromRGBO(0, 0, 0, 1)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  ))),
          Padding(padding: EdgeInsets.only(left: 16)),
          GestureDetector(
              onTap: () {
                widget.callback(2);
                setState(() {
                  selectedIdx = 2;
                });
              },
              child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                        width: 3,
                        color: selectedIdx == 2
                            ? Color.fromRGBO(0, 172, 255, 1)
                            : Colors.transparent),
                  )),
                  child: Center(
                    child: Text(
                      "팬레터",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: selectedIdx == 2
                              ? Color.fromRGBO(0, 0, 0, 1)
                              : Color.fromRGBO(0, 0, 0, 0.3),
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                  )))
        ],
      ),
    );
  }
}
