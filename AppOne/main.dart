import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List names = ['a', 'b', 'c', 'd'];

  /*scrollDirection: Axis.horizontal,
            children: [
              Container(
                height: 400,
                width: 500,
                color: Colors.lightGreen[400],
                child: Text('hahaha'),
              ),

            Container(
                height: 400,
                width: 500,
                color: Colors.lightGreen[300]),
            Container(
                height: 400,
                width: 500,
                color: Colors.lightGreen[200]),
            ],*/
  void ontap() {
    print("hoyeee");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey[600],
        appBar: AppBar(
          title: Text("Android"),
          backgroundColor: Colors.lightGreen[300],
          elevation: 0,
          // same z index
          leading: Icon(Icons.menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.adb))],
          centerTitle: true,
        ),
        body: Center(
          child: GestureDetector(
            onDoubleTap: () {
              //func
              ontap();
            },
            child: Container(
              height: 200,
              width: 100,
              color: Colors.lightGreen[300],
              child: const Center(
                child: Text(
                  "Tap MEH",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
