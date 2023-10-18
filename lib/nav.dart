// Packages
import 'package:cyberapp/quiz/quiz_home.dart';
import 'package:cyberapp/settings.dart';
import 'package:cyberapp/shop.dart';
import 'package:cyberapp/start.dart';
import 'package:cyberapp/user_requests.dart';
import 'package:flutter/material.dart';

import 'helpers/style.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    StartScreen(),
    ShopPage(),
    UserRequestsPage(),
    SettingsPage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),
      // Nav menu
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.dark,
        selectedFontSize: 10,
        selectedIconTheme: IconThemeData(color: AppColors.accent, size: 25),
        selectedItemColor: AppColors.accent,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: AppColors.accent),
        unselectedLabelStyle: TextStyle(color: AppColors.dark),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shop,
            ),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.send_sharp,
            ),
            label: 'QnA',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
            ),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
      ),
    );
  }
}
