import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:country_flags/country_flags.dart';

//상대방이 보낸 메시지 표시 부분
class OtherMsg extends StatefulWidget {
  const OtherMsg(
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
  State<OtherMsg> createState() => _OtherMsg();
}

class _OtherMsg extends State<OtherMsg> {
  @override
  Widget build(BuildContext context) {
    if (widget.msg["type"].toString() == "text" ||//텍스트 메시지
        widget.msg["type"].toString() == "image" || //이미지 메시지
        widget.msg["type"].toString() == "image_ad" ||//광고 메시지
        widget.msg["type"].toString() == "textimg_ad" //텍스트 광고 메시지
        ) {
      return Container(
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.isFirst)
          Container(
            width: 40,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(0, 172, 255, 1))),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(40),
                            child: Image.asset(widget.msg["avatar"].toString()),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 2,
                            child: Container(
                              width: 8,
                              height: 8,
                              decoration: BoxDecoration(
                                  color: widget.msg["status"] == "active"
                                      ? Color.fromRGBO(0, 172, 255, 1)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                          )
                        ],
                      )),
                  Container(
                      constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                      child: Center(
                          child: Text(widget.msg["name"].toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  fontSize: 8,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromRGBO(0, 0, 0, 0.6))))),
                  Padding(padding: EdgeInsets.only(left: 4)),
                  if (widget.msg.containsKey("country"))
                    CountryFlag.fromCountryCode(
                      widget.msg["country"].toString(),
                      height: 14,
                      width: 22,
                      borderRadius: 0,
                    )
                ]),
          ),
        if (!widget.isFirst)
          Container(
            width: 40,
            height: 40,
          ),
        Padding(padding: EdgeInsets.only(left: 8)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (widget.msg["type"].toString() == "text")
              Container(
                  padding: EdgeInsets.all(8),
                  constraints: BoxConstraints(
                      minWidth: 40,
                      maxWidth: MediaQuery.of(context).size.width - 144),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(0, 0, 0, 0.05),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(20),
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
                    maxWidth: MediaQuery.of(context).size.width - 104,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(widget.msg["content"].toString(),
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
                        padding: EdgeInsets.only(
                            left: 8, right: 8, bottom: 8, top: 12),
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Container(
                        constraints: BoxConstraints(
                            minWidth: 40,
                            maxWidth: MediaQuery.of(context).size.width - 84,
                            minHeight: 100,
                            maxHeight: 100),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(20),
                          child: Image.asset(widget.msg["content"].toString(),
                              fit: BoxFit.fitHeight),
                        )),
                    if (widget.msg.containsKey("favCnt") &&
                        widget.msg["favCnt"] > 0)
                      Container(
                          width: 244,
                          height: 30,
                          padding: EdgeInsets.only(left: 4, right: 4),
                          child: Row(
                            children: [
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
                              Padding(padding: EdgeInsets.only(left: 4)),
                              Container(
                                  child: Text(widget.msg["favCnt"].toString(),
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(0, 172, 255, 1)))),
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
            if (widget.msg["type"].toString() != "image_ad")
              Padding(padding: EdgeInsets.only(left: 4)),
            if (widget.msg["type"].toString() != "image_ad")
              Container(
                  height: 30,
                  child: Text(widget.msg["time"].toString(),
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Color.fromRGBO(0, 0, 0, 0.6))))
          ],
        )
      ]));
    }

    return Container(
      width: 0,
      height: 0,
    );
  }
}
