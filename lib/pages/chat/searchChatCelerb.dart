import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SearchChatCelerb extends StatelessWidget {
  const SearchChatCelerb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16),
        height: 64,
        child:
            // TextField(
            //     decoration: InputDecoration(
            //       labelText: '어떤 셀럽을 찾나요?',
            //       filled: true,
            //       fillColor: Color.fromRGBO(243, 247, 253, 1),
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(30.0),
            //       ),
            //       suffixIcon: Icon(Icons.search),
            //     ),
            //     onChanged: (text) {
            //       onSearch(text);
            //     })
            TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.only(top: 14, left: 16, right: 10),
                  fillColor: Color.fromRGBO(243, 247, 253, 1),
                  hintText: "어떤 셀럽을 찾나요?",
                  hintStyle: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.5),
                      fontFamily: 'pretendard'),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1.0),
                  ),
                  suffixIcon: Icon(Icons.search),
                ),
                style: TextStyle(
                    fontFamily: 'pretendard',
                    height: 1,
                    fontSize: 14,
                    decorationThickness: 0.0,
                    color: Colors.white),
                onChanged: (text) {}));
  }

  void onSearch(String sText) {
    print('searching: $sText');
  }
}
