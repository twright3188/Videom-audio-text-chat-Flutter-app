import 'package:crepe/ext/customroute.dart';
import 'package:crepe/pages/cellerbroom/openchatmessage.dart';
import 'package:flutter/material.dart';
import 'package:crepe/pages/opentalk/opentalkheader.dart';
import 'package:crepe/pages/opentalk/mychatroom.dart';
import 'package:crepe/pages/opentalk/currentheartroom.dart';
import 'package:crepe/pages/opentalk/contentroom.dart';
import 'package:crepe/pages/opentalk/cellerbroom.dart';

//오픈톡
class Opentalk extends StatefulWidget {
  const Opentalk({Key? key}) : super(key: key);
  @override
  State<Opentalk> createState() => _Opentalk();
}

class _Opentalk extends State<Opentalk> {
  List<Map<String, dynamic>> my_room_list = [];
  List<Map<String, dynamic>> currentheart_room_list = [];
  List<Map<String, dynamic>> cellerb_room_list = [];
  List<Map<String, dynamic>> content_room_list = [];

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
          child: OpenTalkHeader(onSearch, onBell, onProfile),
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        Expanded(
          flex: 1,
          child: Scrollbar(
              thickness: 0.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: 6,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 1) {
                    return Container(
                        height: my_room_list.length * 64 + 30 + 8,
                        child: MyChatRoom(
                          callback: onSelectedMyRoomItem,
                          my_room_list: my_room_list,
                        ));
                  } else if (index == 2) {
                    return Container(
                        height: currentheart_room_list.length * 64 + 30 + 8,
                        child: CurrentHeartRoom(
                          callback: onSelectedHeartRoomItem,
                          data_list: currentheart_room_list,
                        ));
                  } else if (index == 3) {
                    return Container(
                        height: 290.0,
                        child: CellerbRoom(
                            callback: onSelectedCellerbItem,
                            data_list: cellerb_room_list));
                  } else if (index == 4) {
                    return Container(
                        height: 290.0,
                        child: ContentRoom(
                            callback: onSelectedContentItem,
                            data_list: content_room_list));
                  } else if (index == 5) {
                    return Container(height: 29.0);
                  }

                  return Container(
                      color: Colors.transparent,
                      height: 100.0 * index,
                      child: Text(index.toString()));
                },
                scrollDirection: Axis.vertical,
              )),
        )
      ],
    );
  }

  void getInitData() {
    //api 로 부터 얻을것이다.
    setState(() {
      my_room_list = [
        {
          'avatar': 'assets/images/tmp/g_avatar1.png',
          'title': "고독한 스마일보이",
          'followcnt': '1,250',
          "datetime": "오후 3: 35",
          "text": "사진이 공유되었습니다.",
          "newcnt": "23"
        },
        {
          'avatar': 'assets/images/tmp/g_avatar2.png',
          'title': "SMB 덕메 구해요!",
          'followcnt': '460',
          "datetime": "오후 2: 39",
          "text": "컴백 앨범 뮤직 차트 1위 총공인원 모집합니다. 스마일 화력 보여주세요 ",
          "newcnt": "7"
        }
      ];
      currentheart_room_list = [
        {
          'avatar': 'assets/images/tmp/g_avatar3.png',
          'title': "러블리 캣 덕질방",
          "datetime": " 방금 전",
          "text": "#러블리 #캣 #love #dream #응원해",
          "reviewcnt": "460"
        },
        {
          'avatar': 'assets/images/tmp/g_avatar4.png',
          'title': "스마일보이 고독방 올려",
          "datetime": "3분 전",
          "text": "#고독한 #겨울남자 #우주최강 #스마일보이",
          "reviewcnt": "137"
        },
        {
          'avatar': 'assets/images/tmp/g_avatar5.png',
          'title': "풀리 굿즈 모두 모여라",
          "datetime": "5분 전",
          "text": "#굿즈거래 #시세 #플리 #FULLY",
          "reviewcnt": "47"
        }
      ];
      cellerb_room_list = [
        {
          "title": "스마일보이",
          "items": [
            {
              'avatar': 'assets/images/tmp/g_avatar6.png',
              'title': "스마일보이 응원 총공",
              "datetime": " 방금 전",
              "text": "#러블리 #캣 #love #dream #응원해",
              "reviewcnt": "460"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar7.png',
              'title': "포카 교환 거래방",
              "datetime": "3분 전",
              "text": "#고독한 #겨울남자 #우주최강 #스마일보이",
              "reviewcnt": "137"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar8.png',
              'title': "스마일보이 해외팬 모여",
              "datetime": "5분 전",
              "text": "#굿즈거래 #시세 #플리 #FULLY",
              "reviewcnt": "47"
            }
          ]
        },
        {
          "title": "뮤뮤링 사랑해",
          "items": [
            {
              'avatar': 'assets/images/tmp/g_avatar9.png',
              'title': "러블리 캣 덕질방",
              "datetime": " 방금 전",
              "text": "#러블리 #캣 #love #dream #응원해",
              "reviewcnt": "460"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar10.png',
              'title': "스마일보이 고독방 올려",
              "datetime": "3분 전",
              "text": "#고독한 #겨울남자 #우주최강 #스마일보이",
              "reviewcnt": "137"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar11.png',
              'title': "풀리 굿즈 모두 모여라",
              "datetime": "5분 전",
              "text": "#굿즈거래 #시세 #플리 #FULLY",
              "reviewcnt": "47"
            }
          ]
        }
      ];
      content_room_list = [
        {
          "title": "고독방",
          "subdes": "*사진,짤만 업로드",
          "items": [
            {
              'avatar': 'assets/images/tmp/g_avatar9.png',
              'title': "고독한 스마일보이",
              "datetime": " 방금 전",
              "text": "#스마일보이 #사진 #고독방",
              "reviewcnt": "460"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar10.png',
              'title': "스마일보이 고독방 올려",
              "datetime": "3분 전",
              "text": "#뮤뮤 #사진 #고독한 #우주최강 #스마일보이",
              "reviewcnt": "137"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar11.png',
              'title': "풀리 고독한 사진첩",
              "datetime": "5분 전",
              "text": "#굿즈거래 #시세 #플리 #FULLY",
              "reviewcnt": "47"
            }
          ]
        },
        {
          "title": "스마보 러버",
          "subdes": "*사진,짤만 업로드",
          "items": [
            {
              'avatar': 'assets/images/tmp/g_avatar4.png',
              'title': "고독한 스마일보이12",
              "datetime": " 방금 전",
              "text": "#스마일보이 #사진 #고독방",
              "reviewcnt": "460"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar5.png',
              'title': "스마일보이 고독방 올려12",
              "datetime": "3분 전",
              "text": "#뮤뮤 #사진 #고독한 #우주최강 #스마일보이",
              "reviewcnt": "137"
            },
            {
              'avatar': 'assets/images/tmp/g_avatar6.png',
              'title': "풀리 고독한 사진첩11",
              "datetime": "5분 전",
              "text": "#굿즈거래 #시세 #플리 #FULLY",
              "reviewcnt": "47"
            }
          ]
        }
      ];
    });
  }

  void onSelectedMyRoomItem(Map<String, dynamic> itemData) {
    Navigator.of(context)
        .push(CreateRoute(OpenChatMessage(tabIdx: 0, itemData: itemData)));
  }

  void onSelectedHeartRoomItem(Map<String, dynamic> itemData) {
    if (itemData["text"].toString().contains("#굿즈거래")) {
      Navigator.of(context)
          .push(CreateRoute(OpenChatMessage(tabIdx: 5, itemData: itemData)));
    } else {
      Navigator.of(context)
          .push(CreateRoute(OpenChatMessage(tabIdx: 0, itemData: itemData)));
    }
  }

  void onSelectedCellerbItem(Map<String, dynamic> itemD, int sIdx) {
    var itemData = itemD["items"];
    if (itemData[sIdx]["text"].toString().contains("#굿즈거래")) {
      Navigator.of(context).push(
          CreateRoute(OpenChatMessage(tabIdx: 5, itemData: itemData[sIdx])));
    } else {
      Navigator.of(context).push(
          CreateRoute(OpenChatMessage(tabIdx: 0, itemData: itemData[sIdx])));
    }
  }

  void onSelectedContentItem(Map<String, dynamic> itemD, int sIdx) {
    var itemData = itemD["items"];
    if (itemData[sIdx]["text"].toString().contains("#굿즈거래")) {
      Navigator.of(context).push(
          CreateRoute(OpenChatMessage(tabIdx: 5, itemData: itemData[sIdx])));
    } else {
      Navigator.of(context).push(
          CreateRoute(OpenChatMessage(tabIdx: 0, itemData: itemData[sIdx])));
    }
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
