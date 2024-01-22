import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';

//콜이 들어올 때 페이지
class CallIncome extends StatefulWidget {
  const CallIncome({Key? key, required this.callback}) : super(key: key);
  final Function(bool) callback;
  @override
  State<CallIncome> createState() => _CallIncome();
}

class _CallIncome extends State<CallIncome> {
  var isAnswer = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: 0,
            top: 0,
            child: Container(
                padding: EdgeInsets.zero,
                child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Image.asset("assets/images/bid1_back.png",
                        fit: BoxFit.fill)))),
        Positioned(
          left: 0,
          top: 230,
          width: MediaQuery.of(context).size.width,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('CELEB',
                style: TextStyle(
                    fontFamily: 'gmarketsans',
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w500)),
            Text('calling...',
                style: TextStyle(
                    fontFamily: 'gmarketsans',
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w300)),
          ]),
        ),
        Positioned(
            left: MediaQuery.of(context).size.width / 2 - 145,
            bottom: 140,
            child: Container(
                width: 290,
                height: 78,
                child: Center(
                  child: SliderButton(
                      action: () {
                        widget.callback(true);
                      },
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.5),
                      label: Text(
                        "Slide to answer",
                        style: TextStyle(
                            fontFamily: 'gmarketsans',
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      icon: SizedBox(
                        width: 34,
                        height: 34,
                        child: Image.asset("assets/images/b_heart_icon.png"),
                      )),
                )))
      ],
    );
  }
}
