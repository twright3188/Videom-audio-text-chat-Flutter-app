import 'package:crepe/pages/cellerbroom/sharemodal.dart';
import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'dart:io';

//자기가 보낸 메시지 표시
class MyMsg extends StatefulWidget {
  const MyMsg(
      {Key? key,
      required this.msg,
      required this.isFirst,
      required this.idx,
      required this.callback})
      : super(key: key);
  final Function(int, String) callback;
  final Map<String, dynamic> msg;
  final bool isFirst;
  final int idx;
  @override
  State<MyMsg> createState() => _MyMsg();
}

class _MyMsg extends State<MyMsg> {
  @override
  Widget build(BuildContext context) {
    if (widget.msg["type"].toString() == "text" || //텍스트 메시지
            widget.msg["type"].toString() == "image" || //이미지 메시지
            widget.msg["type"].toString() == "image_ad" || //광고 메시지
            widget.msg["type"].toString() == "textimg_ad" //텍스트가 있는 광고 메시지
        ) {
      return Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
        Spacer(),
        if (widget.msg["type"].toString() != "image_ad")
          Container(
              height: 30,
              child: Text(widget.msg["time"].toString(),
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 0.6)))),
        Padding(padding: EdgeInsets.only(left: 8)),
        if (widget.msg["type"].toString() == "text")
          Container(
              padding: EdgeInsets.all(8),
              constraints: BoxConstraints(
                  minWidth: 40,
                  maxWidth: MediaQuery.of(context).size.width - 104),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 172, 255, 0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Text(widget.msg["content"].toString(),
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(0, 0, 0, 1)))),
        if (widget.msg["type"].toString() == "image")
          Container(
              height: 228,
              constraints: BoxConstraints(
                  minWidth: 40,
                  maxWidth: MediaQuery.of(context).size.width - 104),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(File(widget.msg["content"].toString()),
                    fit: BoxFit.fitHeight),
              )),
        if (widget.msg["type"].toString() == "textimg_ad")
          Container(
              child: Column(children: [
            Container(
                width: 211,
                height: 189,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(243, 247, 253, 1),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  Container(
                      width: 211,
                      height: 115,
                      color: Colors.transparent,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Image.asset(widget.msg["content"].toString(),
                            fit: BoxFit.fitHeight),
                      )),
                  Container(
                    padding:
                        EdgeInsets.only(left: 8, right: 8, bottom: 8, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.msg["title"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                        Text(widget.msg["subdes1"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(0, 0, 0, 1))),
                        Text(widget.msg["subdes2"].toString(),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 1)))
                      ],
                    ),
                  )
                ])),
            Container(
                width: 211,
                height: 30,
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  children: [
                    if (widget.msg.containsKey("favCnt") &&
                        widget.msg["favCnt"] > 0)
                      Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.5),
                              color: Color.fromRGBO(0, 172, 255, 1)),
                          child: Center(
                              child: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: Image.asset(
                                      "assets/images/white_heart.png")))),
                    if (widget.msg.containsKey("favCnt") &&
                        widget.msg["favCnt"] > 0)
                      Padding(padding: EdgeInsets.only(left: 4)),
                    if (widget.msg.containsKey("favCnt") &&
                        widget.msg["favCnt"] > 0)
                      Container(
                          child: Text(widget.msg["favCnt"].toString(),
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 172, 255, 1)))),
                    Spacer()
                  ],
                ))
          ])),
        if (widget.msg["type"].toString() == "image_ad")
          Container(
              child: Column(children: [
            Container(
                constraints: BoxConstraints(
                    minWidth: 40,
                    maxWidth: MediaQuery.of(context).size.width - 84,
                    minHeight: 100,
                    maxHeight: 100),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(widget.msg["content"].toString(),
                      fit: BoxFit.fitHeight),
                )),
            Container(
                width: 244,
                height: 30,
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  children: [
                    if (widget.msg.containsKey("favCnt") &&
                        widget.msg["favCnt"] > 0)
                      Container(
                          width: 17,
                          height: 17,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.5),
                              color: Color.fromRGBO(0, 172, 255, 1)),
                          child: Center(
                              child: SizedBox(
                                  width: 10,
                                  height: 10,
                                  child: Image.asset(
                                      "assets/images/white_heart.png")))),
                    if (widget.msg.containsKey("favCnt") &&
                        widget.msg["favCnt"] > 0)
                      Padding(padding: EdgeInsets.only(left: 4)),
                    if (widget.msg.containsKey("favCnt") &&
                        widget.msg["favCnt"] > 0)
                      Container(
                          child: Text(widget.msg["favCnt"].toString(),
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 172, 255, 1)))),
                    Spacer(),
                    Container(
                        child: Text(widget.msg["time"].toString(),
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(0, 0, 0, 0.6))))
                  ],
                ))
          ])),
      ]));
    }

    if (widget.msg["type"].toString() == "start") {
      return Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Spacer(),
        GestureDetector(
            onTap: () {
              widget.callback(widget.idx, "start_start");
            },
            child: Container(
              width: 105,
              height: 39,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 172, 255, 0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Center(
                  child: Text(
                "시작하기",
                style: TextStyle(
                    fontFamily: 'pretendard',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            )),
        Padding(padding: EdgeInsets.only(left: 8)),
        GestureDetector(
            onTap: () {
              widget.callback(widget.idx, "start_close");
            },
            child: Container(
              width: 30,
              height: 30,
              child: Center(
                  child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset("assets/images/b_close_icon.png"),
              )),
            ))
      ]));
    }

    if (widget.msg["type"].toString() == "share") {
      return Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Spacer(),
        GestureDetector(
            onTap: () {
              widget.callback(widget.idx, "share_start");
              Scaffold.of(context).showBottomSheet<void>(
                (BuildContext context) {
                  return ShareModal(callback: onShareItemClicked);
                },
              );
            },
            child: Container(
              width: 105,
              height: 39,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(0, 172, 255, 0.2),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(4),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Center(
                  child: Text(
                "공유하기",
                style: TextStyle(
                    fontFamily: 'pretendard',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            )),
        Padding(padding: EdgeInsets.only(left: 8)),
        GestureDetector(
            onTap: () {
              widget.callback(widget.idx, "share_confirm");
            },
            child: Container(
              width: 88,
              height: 39,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                  border: Border.all(
                      width: 1, color: Color.fromRGBO(0, 0, 0, 0.2))),
              child: Center(
                  child: Text(
                "확인",
                style: TextStyle(
                    fontFamily: 'pretendard',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              )),
            )),
        Padding(padding: EdgeInsets.only(left: 8)),
        GestureDetector(
            onTap: () {
              widget.callback(widget.idx, "share_close");
            },
            child: Container(
              width: 30,
              height: 30,
              child: Center(
                  child: SizedBox(
                width: 24,
                height: 24,
                child: Image.asset("assets/images/b_close_icon.png"),
              )),
            ))
      ]));
    }
    if (widget.msg["type"].toString() == "progress") {
      return Container(
        height: 60,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Container(
            width: 90,
            height: 39,
            decoration: BoxDecoration(
                color: Color.fromRGBO(0, 172, 255, 0.2),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(4),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Center(
                child: JumpingDots(
                    color: Color.fromRGBO(0, 172, 255, 1),
                    radius: 7,
                    numberOfDots: 3,
                    verticalOffset: 7.0,
                    animationDuration: Duration(milliseconds: 200))),
          ),
          Spacer(),
          Text(
            "메세지를 입력중입니다.",
            style: TextStyle(
                fontFamily: 'pretendard',
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(0, 0, 0, 0.6)),
          )
        ]),
      );
    }
    return Container(
      width: 0,
      height: 0,
    );
  }

  //공유하기를 클릭한 후 표시된 보톰바에서 facebook, instagram, twitter를 클릭 했을 때 처리
  void onShareItemClicked(String buttonType) {
    if (buttonType == "close") widget.callback(widget.idx, "sharemodal_close");
    if (buttonType == "facebook")
      widget.callback(widget.idx, "sharemodal_facebook");
    if (buttonType == "instagram")
      widget.callback(widget.idx, "sharemodal_instagram");
    if (buttonType == "twitter")
      widget.callback(widget.idx, "sharemodal_twitter");
  }
}
