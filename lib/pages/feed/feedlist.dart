import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FeedList extends StatefulWidget {
  const FeedList({Key? key, required this.callback, required this.feed_list})
      : super(key: key);
  final Function(Map<String, dynamic>) callback;
  final List<Map<String, dynamic>> feed_list;
  @override
  State<FeedList> createState() => _FeedList();
}

class _FeedList extends State<FeedList> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: widget.feed_list.length,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              widget.callback(widget.feed_list[index]);
            },
            child: Container(
              // height: widget.feed_list[index]["desText"].toString().isEmpty
              //     ? 206
              //     : 256,
              padding: EdgeInsets.only(top: 4),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: Image.asset(
                              widget.feed_list[index]["avatar"].toString()),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.feed_list[index]["name"].toString(),
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "팔로잉${widget.feed_list[index]["followCnt"].toString()} · 리뷰${widget.feed_list[index]["reviewCnt"].toString()}",
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Colors.grey,
                                      fontSize: 12),
                                )
                              ]),
                        )
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 4)),
                    if (!widget.feed_list[index]["desText"].toString().isEmpty)
                      Container(
                        width: 81,
                        height: 21,
                        color: Color.fromRGBO(0, 172, 255, 1),
                        child: Center(
                            child: Text(
                                widget.feed_list[index]["desText"].toString(),
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700))),
                      ),
                    if (!widget.feed_list[index]["desText"].toString().isEmpty)
                      Padding(padding: EdgeInsets.only(top: 4)),
                    if (!widget.feed_list[index]["answerText"]
                        .toString()
                        .isEmpty)
                      Container(
                        padding: EdgeInsets.only(left: 4, right: 4),
                        height: 21,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 247, 253, 1),
                            border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(0, 172, 255, 1))),
                        child: Text(
                            widget.feed_list[index]["answerText"].toString(),
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                color: Color.fromRGBO(0, 172, 255, 1),
                                fontSize: 12,
                                fontWeight: FontWeight.w700)),
                      ),
                    if (!widget.feed_list[index]["answerText"]
                        .toString()
                        .isEmpty)
                      Padding(padding: EdgeInsets.only(top: 4)),
                    Stack(
                      children: [
                        Container(
                            width:
                                MediaQuery.of(context).size.width / 2 - 16 - 8,
                            height:
                                MediaQuery.of(context).size.width / 2 - 16 - 8,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                widget.feed_list[index]["image"].toString(),
                                fit: BoxFit.fitHeight,
                              ),
                            )),
                        if (widget.feed_list[index]["isMedia"])
                          Positioned.fill(
                              child: Center(
                                  child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/images/play_icon.png"),
                          )))
                      ],
                    )
                  ]),
            ));
      },
    );
  }
}
