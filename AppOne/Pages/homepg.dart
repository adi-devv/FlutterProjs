import 'package:flutter/material.dart';

class HomePg extends StatelessWidget {
  const HomePg({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.lightGreen[300],
        elevation: 0,
        // same z index a
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.adb))],
        centerTitle: true,
      ),
    );
  }
}
