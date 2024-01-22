import 'package:flutter/material.dart';

class ReviewComplete extends StatefulWidget {
  const ReviewComplete({Key? key, required this.callback}) : super(key: key);
  final Function(String) callback;
  @override
  State<ReviewComplete> createState() => _ReviewComplete();
}

class _ReviewComplete extends State<ReviewComplete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 338,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      width: MediaQuery.of(context).size.width - 32,
      child: Column(children: [
        Container(
          height: 30,
          child: Row(children: [
            Container(width: 30, height: 30),
            Spacer(),
            Text(
              '미션 참여 완료',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  widget.callback("close");
                },
                child: Container(
                    width: 30,
                    height: 30,
                    child: Center(
                        child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset("assets/images/b_close_icon.png"),
                    ))))
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
            width: MediaQuery.of(context).size.width - 64,
            padding: EdgeInsets.only(left: 8, right: 8),
            child: Text(
              '축하드려요! 리뷰 작성하기 미션을\n달성하여 포인트가 지급됩니다.',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 16,
                  fontWeight: FontWeight.w500),
            )),
        Spacer(),
        SizedBox(
          width: 125,
          height: 125,
          child: Image.asset("assets/images/reviewcompelete_img.png"),
        ),
        Spacer(),
        SizedBox(
          width: 180,
          height: 42,
          child: FilledButton(
              onPressed: () {
                widget.callback("confirm");
              },
              style: FilledButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0, 172, 255, 1),
                  padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0)),
              child: Center(
                  child: Text(
                '확인',
                style: TextStyle(
                    fontFamily: 'pretendard',
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ))),
        )
      ]),
    );
  }
}
