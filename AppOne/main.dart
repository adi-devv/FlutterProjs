import 'dart:ffi';

import 'package:appone/Pages/first.dart';
import 'package:appone/Pages/second.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: First(),
      routes: {
        '/firstp' : (context) => First(),
        '/secondp': (context) => Second(),
      },
    );
  }
}
//
// Scaffold(
// backgroundColor: Colors.blueGrey[600],
// appBar: AppBar(
// title: Text("Android"),
// backgroundColor: Colors.lightGreen[300],
// elevation: 0,
// // same z index
// leading: Icon(Icons.menu),
// actions: [IconButton(onPressed: () {}, icon: Icon(Icons.adb))],
// centerTitle: true,
// ),
