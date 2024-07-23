import 'dart:ffi';

import 'package:appone/pages/first.dart';
import 'package:appone/pages/homepg.dart';
import 'package:appone/pages/remspg.dart';
import 'package:appone/pages/todopg.dart';
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
      theme: ThemeData(
        primaryColor: Colors.lightGreen[300],
      ),
      routes: {
        '/firstp': (context) => First(),
        '/homepage': (context) => HomePg(),
        '/todopage': (context) => TodoPg(),
        '/remspage': (context) => RemsPg(),
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
