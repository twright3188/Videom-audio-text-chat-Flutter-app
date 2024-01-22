import 'package:flutter/material.dart';

class FeedSearchTabbar extends StatefulWidget {
  const FeedSearchTabbar({Key? key, required this.callback}) : super(key: key);
  final Function(String) callback;
  @override
  State<FeedSearchTabbar> createState() => _FeedSearchTabbar();
}

class _FeedSearchTabbar extends State<FeedSearchTabbar> {
  var selectedIdx = 0;
  var tabNames = ['패션 브랜드별', '활동시기별', '멤버별', '채널별'];
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
    return Container(
        height: 30,
        child: Scrollbar(
            thickness: 0.0,
            child: ListView.builder(
              padding: EdgeInsets.only(left: 16, right: 16),
              itemCount: tabNames.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      widget.callback(tabNames[index]);
                      setState(() {
                        selectedIdx = index;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 16),
                        child: Container(
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border(
                              bottom: BorderSide(
                                  width: 3,
                                  color: selectedIdx == index
                                      ? Color.fromRGBO(0, 172, 255, 1)
                                      : Colors.transparent),
                            )),
                            child: Center(
                              child: Text(
                                tabNames[index],
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: selectedIdx == index
                                        ? Color.fromRGBO(0, 0, 0, 1)
                                        : Color.fromRGBO(0, 0, 0, 0.3),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700),
                              ),
                            ))));
              },
              scrollDirection: Axis.horizontal,
            )));
  }
}
