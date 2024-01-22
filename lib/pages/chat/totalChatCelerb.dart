import 'package:crepe/pages/cellerbroom/cellerbchat.dart';
import 'package:flutter/material.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

var tmp_celerb_list = [
  {
    'image': 'assets/images/tmp/tmp_man3.png',
    'followCnt': '1,000+',
    'heratCnt': '12,345',
    'name': 'CELE',
    'avatar': 'assets/images/tmp/tmp_avatar1.png'
  },
  {
    'image': 'assets/images/tmp/tmp_man4.png',
    'followCnt': '100',
    'heratCnt': '11,345',
    'name': 'CELE2',
    'avatar': 'assets/images/tmp/tmp_avatar1.png'
  },
  {
    'image': 'assets/images/tmp/tmp_man3.png',
    'followCnt': '1,000+',
    'heratCnt': '12,345',
    'name': 'CELE',
    'avatar': 'assets/images/tmp/tmp_avatar1.png'
  }
];

class TotalChatCelerb extends StatelessWidget {
  const TotalChatCelerb({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  '전체 셀럽',
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
            Padding(
                padding: EdgeInsets.only(top: 8),
                child: SizedBox(
                    height: 234,
                    child: Scrollbar(
                        thickness: 0.0,
                        child: ListView.builder(
                          itemCount: tmp_celerb_list.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  print("----------------------tappp imgae");
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CellerbChat()));
                                },
                                child: Container(
                                    width: index == 0 ? 158 : 166,
                                    height: 234,
                                    padding: EdgeInsets.only(
                                        left: index == 0 ? 0 : 8),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            left: 0,
                                            top: 0,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: Image.asset(
                                                  tmp_celerb_list[index]
                                                          ["image"]
                                                      .toString()),
                                            )),
                                        Positioned(
                                            top: 10,
                                            left: 8,
                                            child: SizedBox(
                                              // width: 60,
                                              height: 20,
                                              child: FilledButton(
                                                  onPressed: () {},
                                                  style: FilledButton.styleFrom(
                                                      backgroundColor: Colors
                                                          .black
                                                          .withOpacity(0.7),
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 9,
                                                              vertical: 3)),
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: 10,
                                                        height: 10,
                                                        child: Image.asset(
                                                            "assets/images/groups_icon.png"),
                                                      ),
                                                      Container(
                                                        width: 4,
                                                      ),
                                                      Text(
                                                        '1,000+',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'pretendard',
                                                            color: Colors.white,
                                                            fontSize: 8),
                                                      ),
                                                    ],
                                                  )),
                                            )),
                                        Positioned(
                                            bottom: 10,
                                            left: 16,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 14,
                                                      height: 14,
                                                      child: Image.asset(
                                                          "assets/images/white_heart.png"),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8),
                                                      child: Text(
                                                        '12,345',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'pretendard',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    0.5),
                                                            fontSize: 8),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 4)),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 14,
                                                      height: 14,
                                                      child: Image.asset(
                                                          "assets/images/white_pop.png"),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8),
                                                      child: Text(
                                                        'K-pop',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'pretendard',
                                                            color:
                                                                Color.fromRGBO(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    0.5),
                                                            fontSize: 9),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 4)),
                                                Row(
                                                  children: [
                                                    SizedBox(
                                                      width: 19,
                                                      height: 19,
                                                      child: Image.asset(
                                                          "assets/images/tmp/tmp_avatar1.png"),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 8),
                                                      child: Text(
                                                        'CELEB',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'pretendard',
                                                            color: Colors.white,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ))
                                      ],
                                    )));
                          },
                          scrollDirection: Axis.horizontal,
                        )))),
          ],
        ));
  }

  void onShowMore() {
    print('sshow more');
  }
}
