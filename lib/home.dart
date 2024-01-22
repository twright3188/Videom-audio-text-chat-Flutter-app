import 'package:crepe/util/GlobalFunc.dart';
import 'package:flutter/material.dart';
import 'package:crepe/pages/chatlist.dart';
import 'package:crepe/pages/friends.dart';
import 'package:crepe/pages/feed.dart';
import 'package:crepe/pages/opentalk.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    Chatlist(),
    Feed(),
    Opentalk(),
    Friends()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // 메인 위젯
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/images/tabicon1.png'),
            ),
            label: '셀럽 콜 · 챗',
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/images/tabicon2.png'),
            ),
            label: '피드',
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/images/tabicon3.png'),
            ),
            label: '오픈톡',
          ),
          BottomNavigationBarItem(
            icon: const ImageIcon(
              AssetImage('assets/images/tabicon4.png'),
            ),
            label: '친구',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromRGBO(0, 172, 255, 1),
        unselectedItemColor: Color.fromRGBO(0, 0, 0, 0.5),
        showUnselectedLabels: true,
        selectedLabelStyle:
            TextStyle(fontFamily: 'pretendard', fontWeight: FontWeight.w700),
        unselectedLabelStyle:
            TextStyle(fontWeight: FontWeight.w500, fontFamily: 'pretendard'),
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    //해당 클래스가 호출되었을떄
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
