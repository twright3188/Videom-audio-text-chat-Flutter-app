import 'package:flutter/material.dart';

class FeedSearchFilter extends StatefulWidget {
  const FeedSearchFilter({Key? key, required this.callback}) : super(key: key);
  final Function(Map<String, dynamic>) callback;
  @override
  State<FeedSearchFilter> createState() => _FeedSearchFilter();
}

class _FeedSearchFilter extends State<FeedSearchFilter> {
  var selectedIdx = 0;
  List<Map<String, dynamic>> filterList = [
    {'avatar': 'assets/images/tmp/g_avatar8.png', 'text': '블랙핑크'},
    {'avatar': 'assets/images/tmp/g_avatar7.png', 'text': '지수'},
    {'avatar': 'assets/images/tmp/g_avatar6.png', 'text': '제니'},
    {'avatar': 'assets/images/tmp/g_avatar9.png', 'text': '로제'},
    {'avatar': 'assets/images/tmp/g_avatar3.png', 'text': '미미'}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 34,
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Scrollbar(
            thickness: 0.0,
            child: ListView.builder(
              itemCount: filterList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      widget.callback(filterList[index]);
                      setState(() {
                        selectedIdx = index;
                      });
                    },
                    child: Container(
                        padding: EdgeInsets.only(right: 8),
                        child: Container(
                            height: 34,
                            padding: EdgeInsets.only(left: 8, right: 8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(17),
                                color: selectedIdx == index
                                    ? Color.fromRGBO(0, 172, 255, 1)
                                    : Colors.transparent,
                                border: Border.all(
                                    width: 1,
                                    color: selectedIdx == index
                                        ? Color.fromRGBO(0, 172, 255, 1)
                                        : Colors.black.withOpacity(0.2))),
                            child: Row(children: [
                              SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9.0),
                                      child: Image.asset(
                                          filterList[index]['avatar'],
                                          fit: BoxFit.fitHeight))),
                              Padding(padding: EdgeInsets.only(left: 8)),
                              Text(filterList[index]['text'],
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: selectedIdx == index
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500))
                            ]))));
              },
              scrollDirection: Axis.horizontal,
            )));
  }
}
