import 'package:flutter/material.dart';

class FeedHeader extends StatelessWidget {
  FeedHeader(this.onFeedSearch, this.onFeedWrite);
  Function onFeedSearch;
  Function onFeedWrite;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.only(top: 60, left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 24 + 24 + 8,
            ),
            Spacer(),
            Text(
              'Celebrity name',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  this.onFeedWrite();
                },
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/images/pencil_icon.png"),
                )),
            Padding(padding: EdgeInsets.only(left: 8)),
            GestureDetector(
                onTap: () {
                  this.onFeedSearch();
                },
                child: SizedBox(
                  width: 24,
                  height: 24,
                  child: Image.asset("assets/images/search_icon.png"),
                ))
          ],
        ));
  }
}
