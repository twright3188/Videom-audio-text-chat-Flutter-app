import 'package:flutter/material.dart';

class ReviewText extends StatefulWidget {
  const ReviewText({Key? key, required this.callback}) : super(key: key);
  final Function(String) callback;
  @override
  State<ReviewText> createState() => _ReviewText();
}

class _ReviewText extends State<ReviewText> {
  var msgText = "";
  var txtC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Spacer(),
        Text(
          '아티스트에게 하고싶은 말을 남겨주세요.',
          style: TextStyle(
              fontFamily: 'pretendard',
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700),
        ),
        Padding(padding: EdgeInsets.only(top: 8)),
        Container(
            height: 139,
            padding: EdgeInsets.only(left: 16, right: 16),
            decoration: BoxDecoration(
                color: Color.fromRGBO(250, 250, 250, 1),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                    width: 1, color: Color.fromRGBO(230, 230, 230, 1))),
            child: Column(children: [
              Expanded(
                  flex: 1,
                  child: TextField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: EdgeInsets.only(
                            top: 16, left: 0, right: 0, bottom: 0),
                        fillColor: Colors.transparent,
                        hintText: "여러분의 의견을 모여 더 좋은 환경의 서비스를\n함께 만들어 갈 수 있습니다.",
                        hintStyle: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.4),
                          fontFamily: 'pretendard',
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 1.0),
                        ),
                      ),
                      style: TextStyle(
                          fontFamily: 'pretendard',
                          height: 1,
                          fontSize: 14,
                          decorationThickness: 0.0,
                          color: Colors.black),
                      controller: txtC,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (text) {
                        if (text.length <= 300) {
                          setState(() {
                            msgText = text;
                          });
                          widget.callback(text);
                        } else {
                          txtC.text = msgText;
                        }
                      })),
              Row(
                children: [
                  Spacer(),
                  Text(
                    '${msgText.length} / 300',
                    style: TextStyle(
                        fontFamily: 'pretendard',
                        color: Color.fromRGBO(128, 128, 128, 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              )
            ])),
        Spacer(),
      ]),
    );
  }
}
