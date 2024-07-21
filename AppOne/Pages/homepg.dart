// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class HomePg extends StatefulWidget {
  const HomePg({super.key});

  @override
  State<HomePg> createState() => _HomePgState();
}

class _HomePgState extends State<HomePg> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Tapped",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              _counter.toString(),
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            ElevatedButton(
              onPressed: _incrementCounter,
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreen[300],
              ),
              child: Text("ADD"),
            ),
          ],
        ),
      ),
    );
  }
}
