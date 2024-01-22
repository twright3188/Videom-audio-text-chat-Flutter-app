import 'package:flutter/material.dart';

class ReviewQuality extends StatefulWidget {
  const ReviewQuality(
      {Key? key, required this.setChatQuality, required this.setSettingQuality})
      : super(key: key);
  final Function(int) setChatQuality;
  final Function(int) setSettingQuality;
  @override
  State<ReviewQuality> createState() => _ReviewQuality();
}

class _ReviewQuality extends State<ReviewQuality> {
  var chatReview = 1;
  var settingReview = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Spacer(),
        Text(
          '이외에 서비스 품질은 어떠셨나요?',
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          height: 30,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              '영상 통화 및 채팅',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  setState(() {
                    chatReview = 1;
                  });
                  widget.setChatQuality(1);
                },
                child: Container(
                    width: 30,
                    height: 30,
                    child: Center(
                        child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(chatReview == 1
                          ? "assets/images/b_good_icon.png"
                          : "assets/images/g_good_icon.png"),
                    )))),
            Padding(padding: EdgeInsets.only(left: 16)),
            GestureDetector(
                onTap: () {
                  setState(() {
                    chatReview = 0;
                  });
                  widget.setChatQuality(0);
                },
                child: Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.only(top: 6),
                    child: Center(
                        child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(chatReview == 0
                          ? "assets/images/b_bad_icon.png"
                          : "assets/images/g_bad_icon.png"),
                    )))),
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          height: 30,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text(
              '사전 세팅 및 알림',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  setState(() {
                    settingReview = 1;
                  });
                  widget.setSettingQuality(1);
                },
                child: Container(
                    width: 30,
                    height: 30,
                    child: Center(
                        child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(settingReview == 1
                          ? "assets/images/b_good_icon.png"
                          : "assets/images/g_good_icon.png"),
                    )))),
            Padding(padding: EdgeInsets.only(left: 16)),
            GestureDetector(
                onTap: () {
                  setState(() {
                    settingReview = 0;
                  });
                  widget.setSettingQuality(0);
                },
                child: Container(
                    width: 30,
                    height: 30,
                    padding: EdgeInsets.only(top: 6),
                    child: Center(
                        child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(settingReview == 0
                          ? "assets/images/b_bad_icon.png"
                          : "assets/images/g_bad_icon.png"),
                    )))),
          ]),
        ),
        Spacer(),
      ]),
    );
  }
}
