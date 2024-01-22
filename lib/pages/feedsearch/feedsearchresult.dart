import 'package:crepe/ext/customroute.dart';
import 'package:crepe/pages/feed/feeddetail.dart';
import 'package:crepe/pages/feed/feedlist.dart';
import 'package:crepe/pages/feedsearch/feedsearchfilter.dart';
import 'package:crepe/pages/feedsearch/feedsearchtabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedSearchResult extends StatefulWidget {
  const FeedSearchResult(
      {Key? key, required this.searchText, required this.callback})
      : super(key: key);
  final String searchText;
  final Function(Map<String, dynamic>) callback;
  @override
  State<FeedSearchResult> createState() => _FeedSearchResult();
}

class _FeedSearchResult extends State<FeedSearchResult> {
  List<Map<String, dynamic>> feed_list = [];

  @override
  void initState() {
    super.initState();
    getFeedSearch();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16),
        child: feed_list.length > 0
            ? Column(
                children: [
                  FeedSearchTabbar(callback: feedSearchTabname),
                  Divider(
                    thickness: 1,
                    height: 0,
                    indent: 0,
                    color: Color.fromRGBO(0, 0, 0, 0.2),
                  ),
                  Padding(padding: EdgeInsets.only(top: 16)),
                  FeedSearchFilter(callback: feedSearchFilter),
                  Expanded(
                      flex: 1,
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 8),
                        child: FeedList(
                            callback: onSelectedFeedItem, feed_list: feed_list),
                      )),
                ],
              )
            : Center(
                child: Text("검색된 목록이 없습니다.",
                    style: TextStyle(
                        fontFamily: 'pretendard',
                        color: Color.fromRGBO(119, 129, 132, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400))));
  }

  void feedSearchTabname(String tabname) {
    if (tabname == '패션 브랜드별') {
      getFeedSearch();
    } else {
      List<Map<String, dynamic>> t_list = [];
      setState(() {
        if (tabname == '활동시기별') {
          for (int i = 0; i < feed_list.length; i++) {
            if (i % 2 == 1) {
              t_list.add(feed_list[i]);
            }
          }
        }
        if (tabname == '멤버별') {
          for (int i = 0; i < feed_list.length; i++) {
            if (i % 3 == 2) {
              t_list.add(feed_list[i]);
            }
          }
        }
        if (tabname == '채널별') {
          for (int i = 0; i < feed_list.length; i++) {
            if (i % 3 == 0) {
              t_list.add(feed_list[i]);
            }
          }
        }
        feed_list = t_list;
      });
    }
  }

  void feedSearchFilter(Map<String, dynamic> filterData) {
    if (filterData["text"] == "블랙핑크") {
      getFeedSearch();
    } else {
      List<Map<String, dynamic>> t_list = [];
      for (int i = 0; i < feed_list.length; i++) {
        if (i % 4 == 0) {
          t_list.add(feed_list[i]);
        }
      }
      setState(() {
        feed_list = t_list;
      });
    }
  }

  void onSelectedFeedItem(Map<String, dynamic> feedItem) {
    print(feedItem);
    Navigator.of(context).push(CreateRoute(FeedDetail(itemData: feedItem)));
  }

  void getFeedSearch() {
    //api로 부터 서치
    setState(() {
      feed_list = [
        {
          'image': 'assets/images/tmp/s_img1.png',
          'avatar': 'assets/images/tmp/g_avatar5.png',
          'followCnt': 17,
          'reviewCnt': 30,
          'name': 'Soo_Lov',
          "desText": "셀럽's Pick",
          "answerText": "셀럽 답글",
          "isMedia": false,
        },
        {
          'image': 'assets/images/tmp/s_img2.png',
          'avatar': 'assets/images/tmp/g_avatar3.png',
          'followCnt': 6,
          'reviewCnt': 5,
          'name': 'Jennie love',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img3.png',
          'avatar': 'assets/images/tmp/g_avatar2.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'Blinkkk',
          "desText": "Best",
          "answerText": "이달의 베스트 피드",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img4.png',
          'avatar': 'assets/images/tmp/g_avatar4.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'dodo_j',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img5.png',
          'avatar': 'assets/images/tmp/g_avatar1.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'Blinkkk',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img6.png',
          'avatar': 'assets/images/tmp/g_avatar6.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'dodo_j',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img7.png',
          'avatar': 'assets/images/tmp/g_avatar7.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'lalala23',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img8.png',
          'avatar': 'assets/images/tmp/g_avatar10.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': '러버덕',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img9.png',
          'avatar': 'assets/images/tmp/g_avatar9.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'Chanel Of 1111',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img10.png',
          'avatar': 'assets/images/tmp/g_avatar8.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'OoOo',
          "desText": "",
          "answerText": "",
          "isMedia": false
        },
        {
          'image': 'assets/images/tmp/s_img11.png',
          'avatar': 'assets/images/tmp/g_avatar11.png',
          'followCnt': 7,
          'reviewCnt': 3,
          'name': 'OoOo',
          "desText": "",
          "answerText": "",
          "isMedia": false
        }
      ];
    });
  }
}
