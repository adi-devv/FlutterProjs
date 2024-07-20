import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List names = ['a','b','c','d'];
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
          body: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
              title: Text(names[index%4]+index.toString()),
            ),
          ),
      ),
    );
  }
}
