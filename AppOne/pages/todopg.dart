// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoPg extends StatefulWidget {
  const TodoPg({super.key});

  @override
  State<TodoPg> createState() => _TodoPgState();
}

class _TodoPgState extends State<TodoPg> {
  TextEditingController myController = TextEditingController();

  String greetMsg = "";

  void greet() {
    String userName = myController.text.trim();
    setState(() {
      greetMsg = "Hey, $userName!!";
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
            Container(
              alignment: Alignment.center,
              width: 250, // Adjust the width as needed
              child: TextField(
                controller: myController,
                textAlign: TextAlign.center,
                cursorColor: Colors.white,
                style: TextStyle(
                    color: Colors.white60, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Colors.lightGreen,
                    ),
                  ),
                  hintText: "Your Name",
                  hintStyle: TextStyle(color: Colors.white60),
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
            SizedBox(height: 60),
            Text(
              greetMsg,
              style: TextStyle(color: Colors.lightGreen, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
