import 'dart:ffi';

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String txt;
  VoidCallback onPressed;

  MyButton({
    super.key,
    required this.txt,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
        child: Text(txt),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
    );
  }
}
