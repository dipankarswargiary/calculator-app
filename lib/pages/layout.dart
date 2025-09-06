import 'package:calculator/pages/about_page.dart';
import 'package:calculator/pages/calculator/calculator_page.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:calculator/pages/settings_page.dart';
import 'package:flutter/material.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {

  // it indicates the current active page
  int _currentPageIndex = 0;

  // it updates the current active index page
  void _setCurrentPage (int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  // Pages
  final List _pages = [
    HomePage(),
    CalculatorPage(),
    AboutPage(),
    SettingsPage(),
  ];

  final List _titles = [
    "My Calculator",
    "Calculator",
    "About Us",
    "Settings"
  ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
          _titles[_currentPageIndex],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: _pages[_currentPageIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPageIndex,
        onTap: _setCurrentPage,

        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.deepPurple[50],
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.blueGrey,
        // showSelectedLabels: true,
        // showUnselectedLabels: false,
        iconSize: 30,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
            activeIcon: Icon(Icons.home),
          ),

          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            icon: Icon(Icons.numbers_outlined),
            label: "Calculator",
            activeIcon: Icon(Icons.numbers),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: "About",
            activeIcon: Icon(Icons.info),
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
            activeIcon: Icon(Icons.settings)
          )
        ],
      ),
    );
  }
}