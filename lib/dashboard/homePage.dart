import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:hulegeb_online_agent/dashboard/BottomNavigation/settingScreen.dart';
import 'package:hulegeb_online_agent/dashboard/bottomNavigation/promotionScreen.dart';
import 'package:hulegeb_online_agent/dashboard/bottomNavigation/real_home.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final List<Widget> _bottomNchildrens = [
    RealHome(),
    PromotionScreen(),
    PromotionScreen(),
    // AccountScreen(),
    SettingScreen(),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
        body: _bottomNchildrens[index],
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.black26,
          backgroundColor: Colors.white12,
          buttonBackgroundColor: Colors.black26,
          height: 60,
          items: <Widget>[
            Icon(
              Icons.dashboard,
              size: 20,
              color: Colors.black,
            ),
            Icon(Icons.fiber_new, size: 20, color: Colors.black),
            Icon(Icons.account_balance_wallet_rounded,
                size: 20, color: Colors.black),
            Icon(Icons.settings, size: 20, color: Colors.black),
          ],
          index: 0,
          animationDuration: Duration(milliseconds: 200),
          onTap: (index) {
            debugPrint("Index : $index");
            onTabedAction(index);
          },
        ),
      );

  void onTabedAction(int value) {
    setState(() {
      index = value;
    });
  }
}
