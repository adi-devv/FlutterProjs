import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<int> nombres = [1, 2, 3];
  Set<int> aa = {1, 5, 6, 1, 1}; /*doesnt repeat*/
  Map user = {
    'name': "Heyo",
    'age': 20,
    'height': 180,
  };

  greet(String name) {
    for (int i = 0; i < nombres.length; i++) {
      print(name + nombres[i].toString());
    }
    print(aa);
    return "Successful";
  }

  @override
  Widget build(BuildContext context) {
    String a = greet("OYEHOYE2");
    print(a);
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(),
    );
  }
}
