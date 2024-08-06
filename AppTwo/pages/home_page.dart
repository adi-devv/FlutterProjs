import 'package:apptwo/components/box.dart';
import 'package:apptwo/components/button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[700],
      body: Center(
        child: MyBox(
          color: Colors.blueGrey,
          child: MyButton(
            color: Colors.blueGrey[300],
            onTap: () {},
          ),
        ),
      ),
    );
  }
}
