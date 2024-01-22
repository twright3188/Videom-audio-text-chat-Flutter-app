import 'package:crepe/util/AppPrefs.dart';
import 'package:flutter/material.dart';

class FeedSearchRecentKeyword extends StatefulWidget {
  const FeedSearchRecentKeyword({Key? key, required this.callback})
      : super(key: key);
  final Function(String) callback;
  @override
  State<FeedSearchRecentKeyword> createState() => _FeedSearchRecentKeyword();
}

class _FeedSearchRecentKeyword extends State<FeedSearchRecentKeyword> {
  var msgText = "";
  var txtC = TextEditingController();
  List<String> recentList = [];

  @override
  void initState() {
    super.initState();
    setRecentList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void setRecentList() async {
    Future<List<String>> tmpList = getRecentFeedSearch();
    List<String> list = await tmpList;
    setState(() {
      recentList = list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: recentList.length > 0
            ? Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      for (var i = 0; i < recentList.length; i++)
                        GestureDetector(
                            onTap: () {
                              widget.callback(recentList[i]);
                            },
                            child: Container(
                                padding: EdgeInsets.only(right: 10),
                                height: 30,
                                child: Text("#${recentList[i]}",
                                    style: TextStyle(
                                        fontFamily: 'pretendard',
                                        color: Color.fromRGBO(0, 172, 255, 1),
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500))))
                    ]))
            : Center(
                child: Text("최근 검색어가 없습니다.",
                    style: TextStyle(
                        fontFamily: 'pretendard',
                        color: Color.fromRGBO(119, 129, 132, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400))));
  }
}
