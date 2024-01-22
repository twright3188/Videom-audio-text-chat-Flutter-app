import 'package:crepe/pages/cellerbroom/cellerbchat.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

var tmp_follow_list = [
  {'image': ''}
];

class FollowChat extends StatelessWidget {
  const FollowChat({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '내가 팔로우한',
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                Spacer(),
                GestureDetector(
                    onTap: () {
                      onShowMore();
                    },
                    child: Text(
                      '+',
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ))
              ],
            ),
            Text(
              '좋아하는 셀럽을 추가해보세요.',
              style: TextStyle(
                  fontFamily: 'pretendard',
                  color: Color.fromRGBO(1, 1, 1, 0.5),
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                    height: 77,
                    child: Scrollbar(
                        thickness: 0.0,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (BuildContext context, int index) {
                            if (index <= 0) {
                              return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const CellerbChat()));
                                  },
                                  child: Container(
                                      width: 113,
                                      height: 77,
                                      padding: EdgeInsets.only(
                                          left: index == 0 ? 0 : 8),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: Image.asset(
                                            "assets/images/tmp/tmp_man2.png"),
                                      )));
                            }
                            return GestureDetector(
                                onTap: () {
                                  print("----------------------tappp plus");
                                },
                                child: Container(
                                    width: 121,
                                    height: 77,
                                    padding: EdgeInsets.only(left: 8),
                                    child: Container(
                                      width: 113,
                                      height: 77,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromRGBO(252, 252, 252, 1),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: DashedBorder.fromBorderSide(
                                              dashLength: 2,
                                              side: BorderSide(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.1),
                                                  width: 1))),
                                      child: Center(
                                        child: Text("+",
                                            style: TextStyle(
                                                fontFamily: 'pretendard',
                                                color: Color.fromRGBO(
                                                    230, 230, 230, 1),
                                                fontSize: 32)),
                                      ),
                                    )));
                          },
                          scrollDirection: Axis.horizontal,
                        )))),
            Padding(padding: EdgeInsets.only(top: 8)),
            Container(
                width: 121,
                padding: EdgeInsets.only(left: 4, right: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 19,
                        height: 19,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(9.5),
                          child:
                              Image.asset("assets/images/tmp/tmp_avatar1.png"),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 4),
                      child: Text("CELEB",
                          style: TextStyle(
                              fontFamily: 'pretendard',
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: FontWeight.w700)),
                    ),
                    Spacer(),
                    SizedBox(
                        width: 2.2,
                        height: 9.3,
                        child: Image.asset("assets/images/three_more_dot.png"))
                  ],
                ))
          ],
        ));
  }

  void onShowMore() {
    print('sshow more');
  }
}
