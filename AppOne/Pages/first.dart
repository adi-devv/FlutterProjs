// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:appone/Pages/homepg.dart';
import 'package:appone/Pages/profilepg.dart';
import 'package:appone/Pages/settingspg.dart';
import 'package:flutter/material.dart';

class First extends StatefulWidget {
  First({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  int _selectedIndex = 1;

  void _navigateBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  final List _pages = [First(), ProfilePg(), SettingsPg()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: _pages[_selectedIndex],
      appBar: AppBar(
        title: Text("Android"),
        backgroundColor: Colors.lightGreen[300],
        elevation: 0,
        // same z index a
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.adb))],
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        backgroundColor: Colors.blueGrey[100],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.adb,
                size: 100,
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Home"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/settingspage');
              },
            ),
          ],
        ),
      ),
    );
  }
}
