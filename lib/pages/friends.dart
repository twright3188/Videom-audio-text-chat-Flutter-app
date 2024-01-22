import 'package:flutter/material.dart';
import 'package:crepe/pages/friends/friendsheader.dart';
import 'package:crepe/pages/friends/friendfilter.dart';
import 'package:crepe/pages/friends/friendslist.dart';

//친구
class Friends extends StatefulWidget {
  const Friends({Key? key}) : super(key: key);
  @override
  State<Friends> createState() => _Friends();
}

class _Friends extends State<Friends> {
  List<String> filterList = ["📍 주변 친구 찾기", "🙋 친구 초대", "‍🙋‍♀️ 추천친구"];
  List<Map<String, dynamic>> friends_list = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInitData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: FriendsHeader(onSearch, onBell, onProfile),
        ),
        Container(
          child: FriendsFilter(callback: changedFilter, filterList: filterList),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 8),
              child: FriendsList(
                  callback: onSelectedFriendItem, data_list: friends_list),
            )),
      ],
    );
  }

  void getInitData() {
    //api 로 부터 얻을것이다.
    setState(() {
      friends_list = [
        {
          'avatar': 'assets/images/tmp/g_avatar1.png',
          'title': "Dayday22",
          "text": "데일라이트 팬 ",
          "country": "KR",
          "des": "나랑 친구할 사람😘",
          "is_blue_circle": true
        },
        {
          'avatar': 'assets/images/tmp/g_avatar2.png',
          'title': "스마일보이",
          "text": "스마일보이 팬",
          "country": "KR",
          "des": "포카 교환해요🔥",
          "is_blue_circle": true
        },
        {
          'avatar': 'assets/images/tmp/g_avatar3.png',
          'title': "lovelize_0",
          "text": "러블리 캣 팬",
          "country": "JP",
          "des": "",
          "is_blue_circle": false
        },
        {
          'avatar': 'assets/images/tmp/g_avatar4.png',
          'title': "라일락 조아",
          "text": "라일락 팬",
          "country": "KR",
          "des": "선물모금중💰",
          "is_blue_circle": true
        },
        {
          'avatar': 'assets/images/tmp/g_avatar5.png',
          'title': "스마보 러버",
          "text": "스마일보이 팬",
          "country": "es",
          "des": "",
          "is_blue_circle": true
        },
        {
          'avatar': 'assets/images/tmp/g_avatar6.png',
          'title': "라일락덕",
          "text": "라일락 팬",
          "country": "KR",
          "des": "굿즈 제작 합니당😎",
          "is_blue_circle": false
        },
        {
          'avatar': 'assets/images/tmp/g_avatar7.png',
          'title': "뮤뮤링 사랑해",
          "text": "뮤뮤 팬",
          "country": "es",
          "des": "",
          "is_blue_circle": false
        },
        {
          'avatar': 'assets/images/tmp/g_avatar8.png',
          'title': "풀인럽",
          "text": "풀리 · 뮤뮤 팬.",
          "country": "KR",
          "des": "",
          "is_blue_circle": true
        },
        {
          'avatar': 'assets/images/tmp/g_avatar9.png',
          'title': "xxxx",
          "text": "사진이 공유",
          "country": "KR",
          "des": "",
          "is_blue_circle": false
        },
        {
          'avatar': 'assets/images/tmp/g_avatar10.png',
          'title': "Dayday22",
          "text": "사진이 공유되었습니다.",
          "country": "KR",
          "des": "",
          "is_blue_circle": false
        },
      ];
    });
  }

  void onSelectedFriendItem(Map<String, dynamic> itemData) {
    print("$itemData");
  }

  void changedFilter(int sIdx) {
    print("---------------ssss $sIdx");
  }

  void onSearch(sText) {
    print("---------------ssss $sText");
  }

  void onBell() {
    print("---------------onBell 1234a");
  }

  void onProfile() {
    print("---------------onProfile 1234a");
  }
}
