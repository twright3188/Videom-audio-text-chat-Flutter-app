import 'package:crepe/pages/cellerbroom/cellerbchat.dart';
import 'package:flutter/material.dart';

class TopProfile extends StatelessWidget {
  const TopProfile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          print("----------------------tappp");
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CellerbChat()));
        },
        child: Container(
          child: Stack(children: [
            Container(
                alignment: Alignment.bottomRight,
                padding: EdgeInsets.zero,
                child: Image.asset("assets/images/tmp/tmp_man1.png")),
            Positioned(
                top: MediaQuery.of(context).padding.top + 8,
                left: 26,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 60,
                      height: 20,
                      child: FilledButton(
                        onPressed: () {
                          celebrityOnPressed();
                        },
                        style: FilledButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 9, vertical: 3)),
                        child: Text(
                          'Celebrity',
                          style: TextStyle(
                              color: Color.fromRGBO(0, 172, 255, 1),
                              fontFamily: 'pretendard',
                              fontWeight: FontWeight.w700,
                              fontSize: 9),
                        ),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 4),
                        child: Text(
                          "셀럽이름의 프라이빗 룸 \n오픈 ! ",
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'pretendard',
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ))
                  ],
                )),
            Positioned(
                bottom: 20,
                left: 26,
                child: Row(
                  children: [
                    SizedBox(
                      width: 35,
                      height: 35,
                      child: Image.asset("assets/images/tmp/tmp_avatar1.png"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'CELEB',
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 14,
                                  height: 14,
                                  child: Image.asset(
                                      "assets/images/white_heart.png"),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Text(
                                    '12,345',
                                    style: TextStyle(
                                        fontFamily: 'pretendard',
                                        color: Colors.white,
                                        fontSize: 12),
                                  ),
                                )
                              ],
                            )
                          ]),
                    )
                  ],
                ))
          ]),
        ));
  }

  void celebrityOnPressed() {
    print("celebrityOnPressed 1111");
  }
}
