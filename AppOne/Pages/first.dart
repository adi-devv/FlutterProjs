// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class First extends StatelessWidget {
  const First({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        title: Text("First Page"),
        backgroundColor: Colors.lightGreen[300],
        elevation: 0,
        // same z index a
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.adb))],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.adb, size: 100,),
            ),
          ],
        ),
      ),
    );
  }
}
