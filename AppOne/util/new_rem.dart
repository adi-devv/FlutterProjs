import 'package:appone/util/button_template.dart';
import 'package:flutter/material.dart';

class remBox extends StatelessWidget {
  final TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  remBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

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
              controller: controller,
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
                  onPressed: onCancel,
                ),
                MyButton(
                  txt: "Save",
                  onPressed: onSave,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
