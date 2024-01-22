import 'package:flutter/material.dart';

class MyChatRoom extends StatefulWidget {
  const MyChatRoom(
      {Key? key, required this.callback, required this.my_room_list})
      : super(key: key);
  final Function(Map<String, dynamic>) callback;
  final List<Map<String, dynamic>> my_room_list;
  @override
  State<MyChatRoom> createState() => _MyChatRoom();
}

class _MyChatRoom extends State<MyChatRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '내 채팅방',
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Padding(padding: EdgeInsets.only(top: 0)),
        for (var i = 0; i < widget.my_room_list.length; i++)
          GestureDetector(
              onTap: () {
                widget.callback(widget.my_room_list[i]);
              },
              child: Container(
                height: 64,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: Image.asset(
                          widget.my_room_list[i]["avatar"].toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, top: 0),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                widget.my_room_list[i]["title"].toString(),
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Padding(padding: EdgeInsets.only(left: 4)),
                              Text(
                                widget.my_room_list[i]["followcnt"].toString(),
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // softWrap: true
                              )
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  32 -
                                  45 -
                                  8 -
                                  100,
                              child: Text(
                                widget.my_room_list[i]["text"].toString(),
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                // softWrap: true
                              ))
                        ]),
                    Spacer(),
                    Container(
                      width: 100,
                      height: 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            widget.my_room_list[i]["datetime"].toString(),
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                                fontWeight: FontWeight.w500,
                                fontSize: 9),
                            maxLines: 1,
                          ),
                          Container(
                            padding: EdgeInsets.only(
                                left: 5, right: 4, top: 0, bottom: 0),
                            decoration: BoxDecoration(
                                color: Color.fromRGBO(0, 172, 255, 1),
                                borderRadius: BorderRadius.circular(14)),
                            child: Text(
                                widget.my_room_list[i]["newcnt"].toString(),
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
      ]),
    );
  }
}
