import 'package:crepe/pages/cellerbroom/callrecord.dart';
import 'package:crepe/pages/cellerbroom/sharemodal.dart';
import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'dart:async';

//시간 경과 되었을때 페이지
class CallOut extends StatefulWidget {
  const CallOut({Key? key, required this.callback}) : super(key: key);
  final Function(String) callback;
  @override
  State<CallOut> createState() => _CallOut();
}

class _CallOut extends State<CallOut> {
  var isLoading = true;
  var isSharing = false;
  @override
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 10),
        () => setState(() {
              isLoading = false;
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            top: 0,
            child: Container(
              padding: EdgeInsets.zero,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color.fromRGBO(0, 0, 0, 0.8),
            )),
        Positioned(
            left: 0,
            top: MediaQuery.of(context).padding.top + 8,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      child: Row(children: [
                        SizedBox(
                          width: 52,
                          height: 52,
                          child:
                              Image.asset("assets/images/tmp/tmp_avatar1.png"),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4, top: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CELEB',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  '02.24 03:36',
                                  style: TextStyle(
                                      fontFamily: 'pretendard',
                                      color: Color.fromRGBO(255, 255, 255, 0.7),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                                )
                              ]),
                        )
                      ]),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 20,
                          height: 20,
                          child: Image.asset("assets/images/close_icon.png")),
                    )
                  ]),
            )),
        if (isLoading)
          Positioned(
            left: 16,
            top: MediaQuery.of(context).size.height / 2 - 90,
            width: MediaQuery.of(context).size.width - 32,
            height: 180,
            child: Center(
                child: Container(
                    child: Column(
              children: [
                CircularProgressIndicator(
                  color: Colors.white,
                ),
                Padding(padding: EdgeInsets.only(top: 8)),
                Text(
                  "Loading...",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 12),
                ),
                Padding(padding: EdgeInsets.only(top: 30)),
                Text(
                  "라이브 미팅 종료되어\n비디오로 저장되고 있습니다.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                )
              ],
            ))),
          ),
        if (!isLoading)
          Positioned(
              left: 0,
              top: MediaQuery.of(context).padding.top + 68,
              child: Container(
                padding: EdgeInsets.zero,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 128,
                child: Column(children: [
                  Spacer(),
                  //Padding(padding: EdgeInsets.only(top: 24)),
                  Transform.scale(scale: 1.0, child: CallRecord()),
                  Spacer(),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    child: Row(children: [
                      Spacer(),
                      SizedBox(
                        width: 52,
                        height: 52,
                        child: FilledButton(
                            onPressed: () {
                              setState(() {
                                isSharing = true;
                              });
                              Scaffold.of(context).showBottomSheet<void>(
                                (BuildContext context) {
                                  return ShareModal(
                                      callback: onShareItemClicked);
                                },
                              );
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0)),
                            child: SizedBox(
                                width: 38,
                                height: 38,
                                child: Image.asset(
                                    "assets/images/b_share_icon.png"))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 16)),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(221, 245, 255, 1),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(0, 172, 255, 1))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(0, 172, 255, 1),
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(221, 245, 255, 1))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                                width: 2,
                                color: Color.fromRGBO(221, 245, 255, 1))),
                      ),
                      Padding(padding: EdgeInsets.only(left: 20))
                    ]),
                  ),
                  Padding(padding: EdgeInsets.only(top: 30))
                ]),
              )),
      ],
    );
  }

  void onShareItemClicked(String buttonType) {
    if (buttonType == "close") widget.callback("sharemodal_close");
    if (buttonType == "facebook") widget.callback("sharemodal_facebook");
    if (buttonType == "instagram") widget.callback("sharemodal_instagram");
    if (buttonType == "twitter") widget.callback("sharemodal_twitter");
  }
}
