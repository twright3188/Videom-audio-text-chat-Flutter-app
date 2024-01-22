import 'package:flutter/material.dart';

class CurrentHeartRoom extends StatefulWidget {
  const CurrentHeartRoom(
      {Key? key, required this.callback, required this.data_list})
      : super(key: key);
  final Function(Map<String, dynamic>) callback;
  final List<Map<String, dynamic>> data_list;
  @override
  State<CurrentHeartRoom> createState() => _CurrentHeartRoom();
}

class _CurrentHeartRoom extends State<CurrentHeartRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '지금 핫한',
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Padding(padding: EdgeInsets.only(top: 0)),
        for (var i = 0; i < widget.data_list.length; i++)
          GestureDetector(
              onTap: () {
                widget.callback(widget.data_list[i]);
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
                      child:
                          Image.asset(widget.data_list[i]["avatar"].toString()),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8, top: 0),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.data_list[i]["title"].toString(),
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w700),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width -
                                  32 -
                                  45 -
                                  8,
                              child: Text(
                                widget.data_list[i]["text"].toString(),
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 0, 0, 0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // softWrap: true
                              )),
                          Row(
                            children: [
                              Text(
                                "${widget.data_list[i]["reviewcnt"].toString()}명 · ",
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 0, 0, 0.5),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // softWrap: true
                              ),
                              Text(
                                "${widget.data_list[i]["datetime"].toString()}",
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 172, 255, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                // softWrap: true
                              )
                            ],
                          )
                        ]),
                  ],
                ),
              ))
      ]),
    );
  }
}
