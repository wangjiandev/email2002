import 'package:emailapp2020/CalendarScreen.dart';
import 'package:emailapp2020/ContactScreen.dart';
import 'package:emailapp2020/InboxScreen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        InboxScreen(),
        ContactScreen(),
        CalenderScreen(),
      ].removeAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            title: Text('Inbox'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('Contact'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Calendar'),
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onBarItemTap,
      ),
    );
  }

  void _onBarItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
