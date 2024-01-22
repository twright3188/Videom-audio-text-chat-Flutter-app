import 'package:flutter/material.dart';

class CellerbRoom extends StatefulWidget {
  const CellerbRoom({Key? key, required this.callback, required this.data_list})
      : super(key: key);
  final Function(Map<String, dynamic>, int) callback;
  final List<Map<String, dynamic>> data_list;
  @override
  State<CellerbRoom> createState() => _CellerbRoom();
}

class _CellerbRoom extends State<CellerbRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '셀럽별',
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16),
        ),
        Expanded(
            flex: 1,
            child: Scrollbar(
                thickness: 0.0,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 0),
                  itemCount: widget.data_list.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          widget.callback(widget.data_list[index], -1);
                        },
                        child: Container(
                            padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                            child: Container(
                                width: index == 0 ? 305 : 313,
                                height: 250,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(243, 247, 253, 1),
                                    borderRadius: BorderRadius.circular(14)),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: 16, left: 16, right: 16),
                                          child: Text(
                                            widget.data_list[index]["title"]
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily: 'pretendard',
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700),
                                          )),
                                      for (var i = 0;
                                          i <
                                              widget.data_list[index]["items"]
                                                  .length;
                                          i++)
                                        Container(
                                          padding: EdgeInsets.only(
                                              top: 4, left: 16, right: 16),
                                          height: 64,
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: Image.asset(widget
                                                    .data_list[index]["items"]
                                                        [i]["avatar"]
                                                    .toString()),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, top: 0),
                                              ),
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      widget.data_list[index]
                                                              ["items"][i]
                                                              ["title"]
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'pretendard',
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w700),
                                                    ),
                                                    SizedBox(
                                                        width: 305 -
                                                            32 -
                                                            45 -
                                                            8 -
                                                            60,
                                                        child: Text(
                                                          widget
                                                              .data_list[index]
                                                                  ["items"][i]
                                                                  ["text"]
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'pretendard',
                                                              color: Color
                                                                  .fromRGBO(
                                                                      0,
                                                                      0,
                                                                      0,
                                                                      0.6),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 12),
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          // softWrap: true
                                                        ))
                                                  ]),
                                              Spacer(),
                                              SizedBox(
                                                width: 50,
                                                height: 32,
                                                child: FilledButton(
                                                  onPressed: () {
                                                    widget.callback(
                                                        widget.data_list[index],
                                                        i);
                                                  },
                                                  style: FilledButton.styleFrom(
                                                      backgroundColor:
                                                          Colors.white,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 9,
                                                              vertical: 3)),
                                                  child: Text(
                                                    '참여',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'pretendard',
                                                        color: Color.fromRGBO(
                                                            0, 172, 255, 1),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                    ]))));
                  },
                  scrollDirection: Axis.horizontal,
                )))
      ]),
    );
  }
}
