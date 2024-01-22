import 'package:flutter/material.dart';

class FriendsFilter extends StatefulWidget {
  const FriendsFilter(
      {Key? key, required this.callback, required this.filterList})
      : super(key: key);
  final Function(int) callback;
  final List<String> filterList;

  @override
  State<FriendsFilter> createState() => _FriendsFilter();
}

class _FriendsFilter extends State<FriendsFilter> {
  var selectedIdx = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
      ),
      child: Row(
        children: [
          SizedBox(
            width: 42,
            height: 33,
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    selectedIdx = -1;
                  });
                },
                style: FilledButton.styleFrom(
                    backgroundColor: selectedIdx == -1
                        ? Color.fromRGBO(0, 0, 0, 0.1)
                        : Color.fromRGBO(0, 172, 255, 0.1),
                    side: BorderSide(
                      width: 1,
                      color: selectedIdx == -1
                          ? Color.fromRGBO(0, 0, 0, 0.5)
                          : Color.fromRGBO(0, 172, 255, 0.5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3)),
                child: Center(
                    child: SizedBox(
                  width: 17,
                  height: 15.3,
                  child: Image.asset("assets/images/filter_icon.png"),
                ))),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
          Container(
              width: MediaQuery.of(context).size.width - 32 - 42 - 16,
              height: 33,
              child: Scrollbar(
                  thickness: 0.0,
                  child: ListView.builder(
                    padding: EdgeInsets.only(left: 0),
                    itemCount: widget.filterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          padding: EdgeInsets.only(left: index == 0 ? 0 : 8),
                          child: FilledButton(
                              onPressed: () {
                                widget.callback(index);
                                setState(() {
                                  selectedIdx = index;
                                });
                              },
                              style: FilledButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  side: BorderSide(
                                    width: 1,
                                    color: selectedIdx == index
                                        ? Color.fromRGBO(0, 172, 255, 0.5)
                                        : Color.fromRGBO(0, 0, 0, 0.1),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 3)),
                              child: Center(
                                  child: Text(widget.filterList[index],
                                      style: TextStyle(
                                          fontFamily: 'pretendard',
                                          color: selectedIdx == index
                                              ? Color.fromRGBO(0, 0, 0, 1.0)
                                              : Color.fromRGBO(0, 0, 0, 0.6),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)))));
                    },
                    scrollDirection: Axis.horizontal,
                  )))
        ],
      ),
    );
  }
}
