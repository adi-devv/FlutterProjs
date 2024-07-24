import 'package:appone/util/button_template.dart';
import 'package:flutter/material.dart';

class remBox extends StatelessWidget {
  const remBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueGrey[300],
      contentPadding: EdgeInsets.all(20),
      content: Container(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              decoration: InputDecoration(
                border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                hintText: "Add Reminder",
                hintStyle: TextStyle(color: Colors.white70),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MyButton(
                  txt: "Cancel",
                  onPressed: () {},
                ),
                MyButton(
                  txt: "Save",
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
