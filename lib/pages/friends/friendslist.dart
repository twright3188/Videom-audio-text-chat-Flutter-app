import 'package:flutter/material.dart';
import 'package:country_flags/country_flags.dart';

class FriendsList extends StatefulWidget {
  const FriendsList({Key? key, required this.callback, required this.data_list})
      : super(key: key);
  final Function(Map<String, dynamic>) callback;
  final List<Map<String, dynamic>> data_list;
  @override
  State<FriendsList> createState() => _FriendsList();
}

class _FriendsList extends State<FriendsList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          '친구',
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Padding(padding: EdgeInsets.only(top: 0)),
        Expanded(
          flex: 1,
          child: Scrollbar(
              thickness: 0.0,
              child: ListView.builder(
                padding: const EdgeInsets.all(0),
                itemCount: widget.data_list.length,
                itemBuilder: (BuildContext context, int i) {
                  return GestureDetector(
                      onTap: () {
                        widget.callback(widget.data_list[i]);
                      },
                      child: Container(
                        height: 64,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                width: 45,
                                height: 45,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(22.5),
                                    border: Border.all(
                                        width: widget.data_list[i]
                                                ["is_blue_circle"]
                                            ? 1
                                            : 0,
                                        color: widget.data_list[i]
                                                ["is_blue_circle"]
                                            ? Color.fromRGBO(0, 172, 255, 1)
                                            : Colors.transparent)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(22.5),
                                  child: Image.asset(
                                      widget.data_list[i]["avatar"].toString()),
                                )),
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
                                        widget.data_list[i]["title"].toString(),
                                        style: TextStyle(
                                            fontFamily: 'pretendard',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.only(left: 4)),
                                      CountryFlag.fromCountryCode(
                                        widget.data_list[i]["country"]
                                            .toString(),
                                        height: 14,
                                        width: 22,
                                        borderRadius: 1,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                      child: Text(
                                    widget.data_list[i]["text"].toString(),
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
                            if (widget.data_list[i]["des"]
                                .toString()
                                .isNotEmpty)
                              Container(
                                  height: 30,
                                  padding: EdgeInsets.only(left: 6, right: 6),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22.5),
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromRGBO(0, 0, 0, 0.1))),
                                  child: Center(
                                      child: Text(
                                          widget.data_list[i]["des"].toString(),
                                          style: TextStyle(
                                              fontFamily: 'pretendard',
                                              fontSize: 12,
                                              color:
                                                  Color.fromRGBO(0, 0, 0, 0.6),
                                              fontWeight: FontWeight.w500))))
                          ],
                        ),
                      ));
                },
                scrollDirection: Axis.vertical,
              )),
        )
      ]),
    );
  }
}
