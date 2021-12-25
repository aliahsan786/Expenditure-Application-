import 'package:flutter/material.dart';
import 'package:myapp/board.dart';
import 'package:myapp/main.dart';

import 'Screens/HomeScreen.dart';
import 'Screens/PreviousRecord.dart';

class NavigationBarProject extends StatefulWidget {
  const NavigationBarProject({Key? key}) : super(key: key);

  @override
  _NavigationBarProjectState createState() => _NavigationBarProjectState();
}

class _NavigationBarProjectState extends State<NavigationBarProject> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _pages = <Widget>[
    HomeScreen(),
    MyHomePage(),
    PreviousRecord(),
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money),
            label: 'Daily Expanses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.report_gmailerrorred),
            label: 'Report',
          ),
        ],
      ),
    );
  }
}
