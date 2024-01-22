import 'package:flutter/material.dart';

class FriendsHeader extends StatelessWidget {
  FriendsHeader(this.onFriendsSearch, this.onBell, this.onProfle);
  Function onFriendsSearch;
  Function onBell;
  Function onProfle;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        padding: EdgeInsets.only(top: 60, left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                flex: 1,
                child: Container(
                    height: 40,
                    padding: EdgeInsets.only(right: 8),
                    child: TextField(
                        textAlignVertical: TextAlignVertical.center,
                        decoration: InputDecoration(
                          filled: true,
                          contentPadding:
                              EdgeInsets.only(top: 14, left: 16, right: 10),
                          fillColor: Color.fromRGBO(243, 247, 253, 1),
                          hintText: "누구를 찾나요?",
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 1.0),
                          ),
                          suffixIcon: Icon(Icons.search),
                        ),
                        style: TextStyle(
                          height: 1,
                          fontSize: 14,
                          fontFamily: 'pretendard',
                        ),
                        onChanged: (text) {
                          this.onFriendsSearch(text);
                        }))),
            GestureDetector(
                onTap: () {
                  this.onBell();
                },
                child: Container(
                    width: 30,
                    height: 30,
                    child: Stack(
                      children: [
                        Center(
                            child: SizedBox(
                          width: 24,
                          height: 24,
                          child: Image.asset("assets/images/bell_icon.png"),
                        )),
                        Positioned(
                          bottom: 3,
                          right: 3,
                          child: Container(
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromRGBO(0, 172, 255, 1)),
                          ),
                        )
                      ],
                    ))),
            Padding(padding: EdgeInsets.only(left: 10)),
            GestureDetector(
                onTap: () {
                  this.onProfle();
                },
                child: Container(
                  width: 30,
                  height: 30,
                  child: Center(
                      child: SizedBox(
                    width: 24,
                    height: 24,
                    child: Image.asset("assets/images/profile_icon.png"),
                  )),
                ))
          ],
        ));
  }
}
