import 'package:crepe/pages/callrequest/callbid1.dart';
import 'package:crepe/pages/callrequest/callbid22.dart';
import 'package:crepe/pages/review/reviewcomplete.dart';
import 'package:crepe/pages/review/reviewgoods.dart';
import 'package:crepe/pages/review/reviewqualuty.dart';
import 'package:crepe/pages/review/reviewtext.dart';
import 'package:crepe/pages/review/starmarks.dart';
import 'package:crepe/pages/review/usecomplete.dart';
import 'package:flutter/material.dart';
import 'package:crepe/ext/customroute.dart';

class ReviewMain extends StatefulWidget {
  const ReviewMain({Key? key}) : super(key: key);
  @override
  State<ReviewMain> createState() => _ReviewMain();
}

class _ReviewMain extends State<ReviewMain> {
  var isCompleted = false;
  var starMarks = 0;
  var memoText = "";
  var chatReview = 1;
  var settingReview = 1;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: SafeArea(
            top: false,
            child: Stack(children: [
              Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(padding: EdgeInsets.only(top: 80)),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 30,
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Row(children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 24,
                                  height: 30,
                                  child: Center(
                                      child: SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: Image.asset(
                                        "assets/images/back_icon.png"),
                                  )),
                                )),
                            Spacer(),
                            Text(
                              '리뷰 작성',
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800),
                            ),
                            Spacer(),
                            Container(
                              width: 24,
                              height: 24,
                            )
                          ])),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 16),
                          child: Scrollbar(
                              thickness: 0.0, // 스크롤 너비
                              // isAlwaysShown: true, // 항상 보이기 여부
                              child: ListView.builder(
                                padding: const EdgeInsets.all(0),
                                itemCount: 6,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == 1) {
                                    return Container(
                                        height: 170.0, child: UseComplete());
                                  } else if (index == 2) {
                                    return Container(
                                        height: 120.0,
                                        child:
                                            StarMarks(callback: setStarMark));
                                  } else if (index == 3) {
                                    return Container(
                                        height: 180,
                                        child:
                                            ReviewText(callback: setMemoText));
                                  } else if (index == 4) {
                                    return Container(
                                        height: 180.0,
                                        child: ReviewQuality(
                                            setChatQuality: setChatQuality,
                                            setSettingQuality:
                                                setSettingQuality));
                                  } else if (index == 5) {
                                    return Container(
                                        height: 440.0, child: ReviewGoods());
                                  }

                                  return Container(height: 0, child: Text(""));
                                },
                                scrollDirection: Axis.vertical,
                              )),
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 16)),
                      SizedBox(
                        width: 180,
                        height: 42,
                        child: FilledButton(
                            onPressed: () {
                              setState(() {
                                isCompleted = true;
                              });
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: Color.fromRGBO(0, 172, 255, 1),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0)),
                            child: Center(
                                child: Text(
                              '확인',
                              style: TextStyle(
                                  fontFamily: 'pretendard',
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ))),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30))
                    ],
                  )),
              if (isCompleted)
                Positioned(
                    left: 0,
                    top: 0,
                    child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        child: Column(
                          children: [
                            Spacer(),
                            ReviewComplete(callback: compeleConfirm),
                            Spacer()
                          ],
                        )))
            ])));
  }

  void setStarMark(int marks) {}
  void setMemoText(String str) {}
  void setChatQuality(int isGood) {}
  void setSettingQuality(int isGood) {}
  void compeleConfirm(String str) {
    if (str == "close") {
      setState(() {
        isCompleted = false;
      });
    } else if (str == "confirm") {
      var count = 0;
      Navigator.popUntil(context, (route) {
        count++;
        if (count == 3) {
          return true;
        } else {
          return false;
        }
      });
    }
  }
}
