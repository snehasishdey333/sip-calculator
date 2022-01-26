import 'package:flutter/material.dart';

import 'package:sip_calculator_app/lumpsum.dart';
import 'package:sip_calculator_app/sip.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController = PageController();
  int selectedIndex = 0;

  void onPress(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          controller: pageController,
          children: [
            Sip_Page(),
            LumpSum_Page(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                label: ("Sip Calculator"), icon: Icon(Icons.money_outlined)),
            BottomNavigationBarItem(
                label: ("LumpSum Calculator"), icon: Icon(Icons.money)),
          ],
          // elevation: 5,
          currentIndex: selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.black,
          onTap: onPress,
        ));
  }
}
