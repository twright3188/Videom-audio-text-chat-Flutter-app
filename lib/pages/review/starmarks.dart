import 'package:flutter/material.dart';

class StarMarks extends StatefulWidget {
  const StarMarks({Key? key, required this.callback}) : super(key: key);
  final Function(int) callback;
  @override
  State<StarMarks> createState() => _StarMarks();
}

class _StarMarks extends State<StarMarks> {
  int starMarks = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Spacer(),
        Text(
          '아티스트와의 만남이 어떠셨나요?',
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Row(children: [
          Spacer(),
          for (var i = 0; i < 5; i++)
            GestureDetector(
                onTap: () {
                  setStarMark(i + 1);
                },
                child: Container(
                    width: 36,
                    height: 36,
                    child: Center(
                        child: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset(starMarks >= (i + 1)
                          ? "assets/images/staron_icon.png"
                          : "assets/images/staroff_icon.png"),
                    )))),
          Spacer(),
        ]),
        Spacer(),
      ]),
    );
  }

  void setStarMark(int marks) {
    setState(() {
      starMarks = marks;
    });
    widget.callback(marks);
  }
}
