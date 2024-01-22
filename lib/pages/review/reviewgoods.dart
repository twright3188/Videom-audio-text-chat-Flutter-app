import 'package:flutter/material.dart';

class ReviewGoods extends StatefulWidget {
  const ReviewGoods({Key? key}) : super(key: key);
  @override
  State<ReviewGoods> createState() => _ReviewGoods();
}

class _ReviewGoods extends State<ReviewGoods> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
          width: 42,
          height: 42,
          child: Image.asset("assets/images/goods_icon.png"),
        ),
        Text(
          '리뷰를 작성한 팬분들을 위한\n특별한 혜택이 기다리고 있어요!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        Container(
          height: 60,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 247, 253, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '혜택1',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(left: 16)),
            Text(
              '리뷰를 작성하면 나의 아티스트에게\n도움이 되며 포인트가 일부 적립됩니다.',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          height: 60,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 247, 253, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '혜택2',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(left: 16)),
            Text(
              '이달의 베스트 리뷰어로 선정이 되면 상단에\n노출되어 아티스트가 기억할 확률이 높아져요!',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
          height: 60,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 247, 253, 1),
              borderRadius: BorderRadius.circular(10)),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '혜택3',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w700),
            ),
            Padding(padding: EdgeInsets.only(left: 16)),
            Text(
              '매달 베스트 주접왕 뽑기 대회가 열립니다.\n리뷰로 당신의 주접을 보여주세요! ',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            )
          ]),
        ),
        Padding(padding: EdgeInsets.only(top: 16)),
        Container(
            height: 30,
            child: Row(children: [
              Text(
                '“',
                style: TextStyle(
                    fontFamily: 'pretendard',
                    color: Color.fromRGBO(0, 172, 255, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              ),
              Spacer(),
              Text(
                '”',
                style: TextStyle(
                    fontFamily: 'pretendard',
                    color: Color.fromRGBO(0, 172, 255, 1),
                    fontSize: 36,
                    fontWeight: FontWeight.w500),
              )
            ])),
        Text(
          '베스트 리뷰어, 주접왕 등에 당첨된 팬분들을 대상으로\n후속 팬 서비스를 기회를 드리고자 합니다.',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Color.fromRGBO(0, 172, 255, 1),
              fontSize: 14,
              fontWeight: FontWeight.w700),
        ),
        Spacer(),
      ]),
    );
  }
}
