import 'package:flutter/material.dart';

//공유하기를 클릭할 때 보여주는 보톰바
class ShareModal extends StatefulWidget {
  const ShareModal({Key? key, required this.callback}) : super(key: key);
  final Function(String) callback;
  @override
  State<ShareModal> createState() => _ShareModal();
}

class _ShareModal extends State<ShareModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 288,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              child: Row(children: [
                Text(
                  "공유하기",
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.callback("close");
                  },
                  child: Container(
                      width: 20,
                      height: 20,
                      child: Image.asset("assets/images/b_close_icon.png")),
                )
              ]),
            ),
            Padding(padding: EdgeInsets.only(top: 16)),
            Container(
              height: 63,
              padding: EdgeInsets.only(left: 8, right: 8),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.callback("instagram");
                  },
                  child: Row(children: [
                    Container(
                        width: 63,
                        height: 2063,
                        child: Image.asset("assets/images/instagram_icon.png")),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text(
                      "INSTAGRAM",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    )
                  ])),
            ),
            Container(
              height: 63,
              padding: EdgeInsets.only(left: 8, right: 8),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.callback("facebook");
                  },
                  child: Row(children: [
                    Container(
                        width: 63,
                        height: 2063,
                        child: Image.asset("assets/images/facebook_icon.png")),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text(
                      "FACEBOOK",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    )
                  ])),
            ),
            Container(
              height: 63,
              padding: EdgeInsets.only(left: 8, right: 8),
              child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    widget.callback("twitter");
                  },
                  child: Row(children: [
                    Container(
                        width: 63,
                        height: 2063,
                        child: Image.asset("assets/images/twitter_icon.png")),
                    Padding(padding: EdgeInsets.only(left: 16)),
                    Text(
                      "TWITTER",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 14),
                    )
                  ])),
            )
          ],
        ));
  }
}
