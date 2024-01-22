import 'package:crepe/pages/chat/searchChatCelerb.dart';
import 'package:flutter/material.dart';
import 'package:crepe/pages/chat/TopProfile.dart';
import 'package:crepe/pages/chat/searchChatCelerb.dart';
import 'package:crepe/pages/chat/followChat.dart';
import 'package:crepe/pages/chat/totalChatCelerb.dart';

class Chatlist extends StatelessWidget {
  const Chatlist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scrollbar(
        thickness: 0.0, // 스크롤 너비
        // isAlwaysShown: true, // 항상 보이기 여부
        child: ListView.builder(
          padding: const EdgeInsets.all(0),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Container(
                  height: 379,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(0, 172, 255, 1),
                        Color.fromRGBO(84, 220, 244, 1),
                      ],
                    ),
                  ),
                  child: TopProfile());
            } else if (index == 1) {
              return Container(
                  color: Colors.transparent, child: SearchChatCelerb());
            } else if (index == 2) {
              return Container(
                  color: Colors.transparent,
                  height: 208.0,
                  child: FollowChat());
            } else if (index == 3) {
              return Container(
                  color: Colors.transparent,
                  height: 308.0,
                  child: TotalChatCelerb());
            }

            return Container(
                color: Colors.transparent, height: 0, child: Text(""));
          },
          scrollDirection: Axis.vertical,
        ));
  }
}
