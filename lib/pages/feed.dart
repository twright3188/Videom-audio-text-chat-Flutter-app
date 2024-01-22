import 'package:crepe/ext/customroute.dart';
import 'package:crepe/pages/feed/feeddetail.dart';
import 'package:crepe/pages/feedsearch/feedsearching.dart';
import 'package:flutter/material.dart';
import 'package:crepe/pages/feed/feedheader.dart';
import 'package:crepe/pages/feed/feedtabbar.dart';
import 'package:crepe/pages/feed/feedfilter.dart';
import 'package:crepe/pages/feed/feedlist.dart';

List<Map<String, dynamic>> tmp_feed_list = [
  {
    'image': 'assets/images/tmp/g_img1.png',
    'avatar': 'assets/images/tmp/g_avatar1.png',
    'followCnt': 17,
    'reviewCnt': 30,
    'name': '냥냥이',
    "desText": "셀럽's Pick",
    "answerText": "셀럽 답글",
    "isMedia": true
  },
  {
    'image': 'assets/images/tmp/g_img2.png',
    'avatar': 'assets/images/tmp/g_avatar2.png',
    'followCnt': 6,
    'reviewCnt': 5,
    'name': '멍냥부리',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img3.png',
    'avatar': 'assets/images/tmp/g_avatar3.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '고먐미96',
    "desText": "Best",
    "answerText": "이달의 베스트 피드",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img4.png',
    'avatar': 'assets/images/tmp/g_avatar4.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '멍뭉이',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img5.png',
    'avatar': 'assets/images/tmp/g_avatar5.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '러버덕',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img6.png',
    'avatar': 'assets/images/tmp/g_avatar6.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '글로리',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img7.png',
    'avatar': 'assets/images/tmp/g_avatar7.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '스마일리',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img8.png',
    'avatar': 'assets/images/tmp/g_avatar8.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '스마보 러버',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img9.png',
    'avatar': 'assets/images/tmp/g_avatar9.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '페퍼민트',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img10.png',
    'avatar': 'assets/images/tmp/g_avatar10.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': 'SMBOOO',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img11.png',
    'avatar': 'assets/images/tmp/g_avatar11.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': 'Lovely',
    "desText": "",
    "answerText": "",
    "isMedia": false
  },
  {
    'image': 'assets/images/tmp/g_img12.png',
    'avatar': 'assets/images/tmp/g_avatar12.png',
    'followCnt': 7,
    'reviewCnt': 3,
    'name': '페퍼민트',
    "desText": "",
    "answerText": "",
    "isMedia": false
  }
];

//피트
class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);
  @override
  State<Feed> createState() => _Feed();
}

class _Feed extends State<Feed> {
  var selectedTabIdx = 0;
  var favoritUp = true;
  var mediaUp = true;
  var followUp = true;
  List<Map<String, dynamic>> feed_list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      feed_list = tmp_feed_list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: FeedHeader(onSearchClicked, onWriteClicked),
        ),
        Container(
          child: FeedTabbar(callback: onSelectedTab),
        ),
        Divider(
          thickness: 1,
          height: 0,
          indent: 0,
          color: Colors.grey,
        ),
        Container(
          child: FeedFilter(callback: changedFilter),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              child:
                  FeedList(callback: onSelectedFeedItem, feed_list: feed_list),
            )),
      ],
    );
  }

  void onSearchClicked() {
    Navigator.of(context).push(CreateRoute(FeedSearching()));
  }

  void onWriteClicked() {
    print("---------------write 1234a");
  }

  void onSelectedFeedItem(Map<String, dynamic> feedItem) {
    Navigator.of(context).push(CreateRoute(FeedDetail(itemData: feedItem)));
  }

  void onSelectedTab(int tabIdx) {
    print("---------------ssss $tabIdx a");
    setState(() {
      List<Map<String, dynamic>> t_list = [];
      if (tabIdx == 0) {
        for (int i = 0; i < tmp_feed_list.length; i++) {
          t_list.add(tmp_feed_list[i]);
        }
      }
      if (tabIdx == 1) {
        for (int i = 0; i < tmp_feed_list.length; i++) {
          if (i % 2 == 0) {
            t_list.add(tmp_feed_list[i]);
          }
        }
      }
      if (tabIdx == 2) {
        for (int i = 0; i < tmp_feed_list.length; i++) {
          if (i % 2 == 1) {
            t_list.add(tmp_feed_list[i]);
          }
        }
      }
      feed_list = t_list;
    });
  }

  void changedFilter(bool favorite, bool media, bool follow) {
    print("---------------ssss $favorite $media $follow a");
  }
}
