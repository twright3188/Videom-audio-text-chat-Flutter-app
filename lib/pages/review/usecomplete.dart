import 'package:flutter/material.dart';

class UseComplete extends StatefulWidget {
  const UseComplete({Key? key}) : super(key: key);
  @override
  State<UseComplete> createState() => _UseComplete();
}

class _UseComplete extends State<UseComplete> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: Offset(1, 1),
                  color: Color.fromRGBO(0, 0, 0, 0.2))
            ]),
        child: Column(children: [
          Text(
            'CELEB x 10분간 1:1 채팅권',
            style: TextStyle(
                fontFamily: 'pretendard',
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.w700),
          ),
          Spacer(),
          SizedBox(
            width: 36,
            height: 36,
            child: Image.asset("assets/images/b_comple_icon.png"),
          ),
          Text(
            '이용 완료',
            style: TextStyle(
                fontFamily: 'pretendard',
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w400),
          ),
          Spacer(),
          Text(
            'CELEB x 10분간 1:1 채팅권',
            style: TextStyle(
                fontFamily: 'pretendard',
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400),
          )
        ]),
      ),
    );
  }
}
