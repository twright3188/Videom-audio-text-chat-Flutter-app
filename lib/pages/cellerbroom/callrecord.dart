import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

//레코딩된 결과를 보여주는 페이지
class CallRecord extends StatefulWidget {
  const CallRecord({Key? key}) : super(key: key);
  @override
  State<CallRecord> createState() => _CallRecord();
}

class _CallRecord extends State<CallRecord> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 577,
      child: Stack(children: [
        Positioned(
          left: 0,
          top: 0,
          width: 300,
          height: 577,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                "assets/images/maskgroup_back.png",
                fit: BoxFit.fill,
              )),
        ),
        Positioned(
          left: 0,
          top: 0,
          width: 300,
          height: 577,
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Container(
                width: 300 - 32,
                height: 44,
                child: Row(children: [
                  Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22)),
                      child: Center(
                          child: SizedBox(
                              width: 30,
                              height: 30,
                              child: Image.asset(
                                  "assets/images/b_heart_icon.png")))),
                  Padding(padding: EdgeInsets.only(left: 16)),
                  Text(
                    "CELEB",
                    style: TextStyle(
                        fontFamily: 'pretendard',
                        color: Color.fromRGBO(0, 172, 255, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  )
                ]),
              ),
              Padding(padding: EdgeInsets.only(top: 8)),
              Container(
                width: 300 - 32,
                height: 340,
                child: Row(children: [
                  Container(
                    width: 24,
                    child: Column(children: [
                      RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "PRIVATE CALL",
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                color: Color.fromRGBO(0, 172, 255, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          )),
                      Spacer(),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/images/arrow1_img.png")),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      SizedBox(
                          width: 30,
                          height: 30,
                          child: Image.asset("assets/images/arrow2_img.png")),
                      Spacer(),
                      RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            "CELEB",
                            style: TextStyle(
                                fontFamily: 'pretendard',
                                color: Color.fromRGBO(0, 172, 255, 1),
                                fontWeight: FontWeight.w700,
                                fontSize: 18),
                          ))
                    ]),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.only(left: 2, right: 2),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            "assets/images/bid1_back.png",
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                  Container(
                    width: 24,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "crepe",
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 172, 255, 1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              )),
                          Padding(padding: EdgeInsets.only(top: 8)),
                          for (var i = 0; i < 4; i++)
                            Container(
                              padding: EdgeInsets.only(top: 4),
                              child: Container(
                                  width: 12,
                                  height: 7,
                                  color: Color.fromRGBO(0, 172, 255, 1)),
                            ),
                          Spacer(),
                          RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                "00:60:00",
                                style: TextStyle(
                                    fontFamily: 'pretendard',
                                    color: Color.fromRGBO(0, 172, 255, 1),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16),
                              ))
                        ]),
                  )
                ]),
              ),
              Padding(padding: EdgeInsets.only(top: 50)),
              Container(
                width: 300 - 32,
                height: 100,
                child: Column(children: [
                  Text(
                    "Dear. glueme",
                    style: TextStyle(
                        fontFamily: 'pretendard',
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 16),
                  ),
                  Spacer(),
                  Text("DATE",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18)),
                  Text("3. 27. 18:00",
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 25))
                ]),
              ),
            ]),
          ),
        )
      ]),
    );
  }
}
