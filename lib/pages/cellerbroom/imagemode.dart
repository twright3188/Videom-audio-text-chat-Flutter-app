import 'package:flutter/material.dart';

class ImageMode extends StatefulWidget {
  const ImageMode(
      {Key? key, required this.openCamera, required this.openGallery})
      : super(key: key);
  final Function openCamera;
  final Function openGallery;
  @override
  State<ImageMode> createState() => _ImageMode();
}

class _ImageMode extends State<ImageMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12)),
            boxShadow: [
              BoxShadow(blurRadius: 12, color: Color.fromRGBO(0, 0, 0, 0.7))
            ]),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: 30,
            child: Row(children: [
              Text(
                "이미지 선택",
                style: TextStyle(
                    fontFamily: 'pretendard',
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: 20,
                    height: 20,
                    child: Image.asset("assets/images/b_close_icon.png")),
              )
            ]),
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 8, right: 8),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.openCamera();
                },
                child: Text(
                  "카메라로 부터",
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                )),
          ),
          Container(
            height: 50,
            padding: EdgeInsets.only(left: 8, right: 8),
            child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  widget.openGallery();
                },
                child: Text(
                  "갤러리로 부터",
                  style: TextStyle(
                      fontFamily: 'pretendard',
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                )),
          )
        ]));
  }
}
