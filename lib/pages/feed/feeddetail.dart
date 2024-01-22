import 'package:crepe/pages/feedsearch/feedsearchrecentkeyword.dart';
import 'package:crepe/pages/feedsearch/feedsearchresult.dart';
import 'package:crepe/util/AppPrefs.dart';
import 'package:flutter/material.dart';

//피드를 클릭 할때 표시되는 상세 페이지
class FeedDetail extends StatefulWidget {
  const FeedDetail({Key? key, required this.itemData}) : super(key: key);
  final Map<String, dynamic> itemData;
  @override
  State<FeedDetail> createState() => _FeedDetail();
}

class _FeedDetail extends State<FeedDetail> {
  List<Map<String, dynamic>> relatedList = [];
  @override
  void initState() {
    super.initState();
    getRelatedList();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void getRelatedList() {
    setState(() {
      if (!widget.itemData["desText"].toString().isEmpty) {
        relatedList = [
          {'image': 'assets/images/tmp/s_img2.png'},
          {'image': 'assets/images/tmp/s_img4.png'},
          {'image': 'assets/images/tmp/s_img3.png'},
          {'image': 'assets/images/tmp/g_img5.png'}
        ];
      } else {
        relatedList = [
          {'image': 'assets/images/tmp/sd_img3.png'},
          {'image': 'assets/images/tmp/sd_img4.png'},
          {'image': 'assets/images/tmp/s_img10.png'}
        ];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            top: true,
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Stack(children: [
                  Scrollbar(
                      thickness: 0.0, // 스크롤 너비
                      // isAlwaysShown: true, // 항상 보이기 여부
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        itemCount: 5,
                        itemBuilder: (BuildContext context, int index) {
                          if (index == 0) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 478,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              child: Stack(children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width,
                                    height: 478,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20)),
                                        child: Image.asset(
                                            !widget.itemData["desText"]
                                                    .toString()
                                                    .isEmpty
                                                ? 'assets/images/tmp/sd_img1.png'
                                                : 'assets/images/tmp/sd_img2.png',
                                            fit: BoxFit.fitWidth))),
                                Positioned(
                                    bottom: 20,
                                    right: 20,
                                    child: GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                            width: 41,
                                            height: 41,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.5),
                                                color: Colors.white
                                                    .withOpacity(0.6)),
                                            child: Center(
                                                child: SizedBox(
                                              width: 25,
                                              height: 25,
                                              child: Image.asset(
                                                  "assets/images/rect_search_icon.png"),
                                            )))))
                              ]),
                            );
                          } else if (index == 1) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              height: 56,
                              padding:
                                  EdgeInsets.only(top: 16, left: 16, right: 16),
                              child: Row(children: [
                                SizedBox(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset(widget.itemData["avatar"],
                                      fit: BoxFit.fitWidth),
                                ),
                                Padding(padding: EdgeInsets.only(left: 8)),
                                Text(widget.itemData['name'],
                                    style: TextStyle(
                                        fontFamily: 'pretendard',
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18)),
                                Spacer(),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        width: 78,
                                        height: 40,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Color.fromRGBO(
                                                243, 247, 253, 1)),
                                        child: Center(
                                            child: Text("팔로우",
                                                style: TextStyle(
                                                    fontFamily: 'pretendard',
                                                    color: Color.fromRGBO(
                                                        0, 172, 255, 1),
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 16)))))
                              ]),
                            );
                          } else if (index == 2) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 80,
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (!widget.itemData["desText"]
                                          .toString()
                                          .isEmpty)
                                        Wrap(children: [
                                          Text("지수와 함께하는 ITMICHAA ",
                                              style: TextStyle(
                                                  fontFamily: 'pretendard',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14)),
                                          Text("특별 에디션, 입고싶다면?",
                                              style: TextStyle(
                                                  fontFamily: 'pretendard',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14))
                                        ]),
                                      if (widget.itemData["desText"]
                                          .toString()
                                          .isEmpty)
                                        Wrap(children: [
                                          Text("5,650,000원 ",
                                              style: TextStyle(
                                                  fontFamily: 'pretendard',
                                                  color: Color.fromRGBO(
                                                      0, 172, 255, 1),
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14)),
                                          Text(
                                              "Chanel Phone Holder With Chain ",
                                              style: TextStyle(
                                                  fontFamily: 'pretendard',
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 14))
                                        ]),
                                      Padding(padding: EdgeInsets.only(top: 8)),
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: Image.asset(
                                                "assets/images/b_favorite_icon.png"),
                                          ),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 4)),
                                          Text(
                                              widget.itemData["followCnt"]
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily: 'pretendard',
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14)),
                                          Padding(
                                              padding:
                                                  EdgeInsets.only(left: 32)),
                                          GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  child: Center(
                                                      child: SizedBox(
                                                    width: 16,
                                                    height: 14,
                                                    child: Image.asset(
                                                        "assets/images/upload_icon.png",
                                                        fit: BoxFit.fill),
                                                  ))))
                                        ],
                                      )
                                    ]));
                          } else if (index == 3) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                height: 190,
                                padding: EdgeInsets.only(
                                    top: 16, left: 16, right: 16),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                        children: [
                                          if (!widget.itemData["desText"]
                                              .toString()
                                              .isEmpty)
                                            Text("유사한 피드 추천",
                                                style: TextStyle(
                                                    fontFamily: 'pretendard',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16)),
                                          if (widget.itemData["desText"]
                                              .toString()
                                              .isEmpty)
                                            Text("제품 상세컷",
                                                style: TextStyle(
                                                    fontFamily: 'pretendard',
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16)),
                                          if (widget.itemData["desText"]
                                              .toString()
                                              .isEmpty)
                                            Text(" ${relatedList.length}",
                                                style: TextStyle(
                                                    fontFamily: 'pretendard',
                                                    color: Color.fromRGBO(
                                                        0, 172, 255, 1),
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: 16)),
                                        ],
                                      ),
                                      Padding(padding: EdgeInsets.only(top: 8)),
                                      Expanded(
                                          flex: 1,
                                          child: Scrollbar(
                                              thickness: 0.0,
                                              child: ListView.builder(
                                                itemCount: relatedList.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index) {
                                                  return GestureDetector(
                                                      onTap: () {},
                                                      child: Container(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          child: SizedBox(
                                                            width: 149,
                                                            height: 149,
                                                            child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                                child: Image.asset(
                                                                    relatedList[
                                                                            index]
                                                                        [
                                                                        "image"],
                                                                    fit: BoxFit
                                                                        .fitHeight)),
                                                          )));
                                                },
                                                scrollDirection:
                                                    Axis.horizontal,
                                              )))
                                    ]));
                          } else if (index == 4) {
                            return Container(
                                color: Colors.transparent, height: 30);
                          }

                          return Container(
                              color: Colors.transparent,
                              height: 0,
                              child: Text(""));
                        },
                        scrollDirection: Axis.vertical,
                      )),
                  Positioned(
                      left: 0,
                      top: 32,
                      child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Row(children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset(
                                      "assets/images/w_back_icon.png"),
                                )),
                            Spacer(),
                            GestureDetector(
                                onTap: () {},
                                child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Image.asset(
                                      "assets/images/w_more_icon.png"),
                                ))
                          ])))
                ]))));
  }
}
