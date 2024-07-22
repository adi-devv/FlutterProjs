// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoPg extends StatefulWidget {
  const TodoPg({super.key});

  @override
  State<TodoPg> createState() => _TodoPgState();
}

class _TodoPgState extends State<TodoPg> {
  TextEditingController myController = TextEditingController();

  void greet() {
    print(myController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: 300, // Adjust the width as needed
              child: TextField(
                controller: myController,
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: greet,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen[300],
              ),
              child: Text(
                "Tap",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
