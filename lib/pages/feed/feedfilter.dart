import 'package:flutter/material.dart';

class FeedFilter extends StatefulWidget {
  const FeedFilter({Key? key, required this.callback}) : super(key: key);
  final Function(bool, bool, bool) callback;
  @override
  State<FeedFilter> createState() => _FeedFilter();
}

class _FeedFilter extends State<FeedFilter> {
  var favoritUp = true;
  var mediaUp = true;
  var followUp = true;
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
            width: 81,
            height: 34,
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    widget.callback(!favoritUp, mediaUp, followUp);
                    favoritUp = !favoritUp;
                  });
                },
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3)),
                child: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      '인기순',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: favoritUp
                          ? Image.asset("assets/images/arrow_up.png")
                          : Image.asset("assets/images/arrow_down.png"),
                    ),
                    Spacer()
                  ],
                ))),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
          SizedBox(
            width: 81,
            height: 34,
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    widget.callback(favoritUp, !mediaUp, followUp);
                    mediaUp = !mediaUp;
                  });
                },
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3)),
                child: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      '동영상',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: mediaUp
                          ? Image.asset("assets/images/arrow_up.png")
                          : Image.asset("assets/images/arrow_down.png"),
                    ),
                    Spacer()
                  ],
                ))),
          ),
          Padding(padding: EdgeInsets.only(left: 8)),
          SizedBox(
            width: 81,
            height: 34,
            child: FilledButton(
                onPressed: () {
                  setState(() {
                    widget.callback(favoritUp, mediaUp, !followUp);
                    followUp = !followUp;
                  });
                },
                style: FilledButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: BorderSide(
                      width: 1,
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3)),
                child: Center(
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    Text(
                      '팔로잉',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Color.fromRGBO(0, 0, 0, 0.5),
                          fontSize: 14),
                    ),
                    SizedBox(
                      width: 24,
                      height: 24,
                      child: followUp
                          ? Image.asset("assets/images/arrow_up.png")
                          : Image.asset("assets/images/arrow_down.png"),
                    ),
                    Spacer()
                  ],
                ))),
          )
        ],
      ),
    );
  }
}
