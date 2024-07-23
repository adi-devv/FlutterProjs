// ignore_for_file: prefer_const_constructors

import 'package:appone/util/new_rem.dart';
import 'package:appone/util/rem_tile.dart';
import 'package:flutter/material.dart';

class RemsPg extends StatefulWidget {
  const RemsPg({super.key});

  @override
  State<RemsPg> createState() => _RemsPgState();
}

class _RemsPgState extends State<RemsPg> {
  List remTasks = [
    ["Make App", false],
    ["Read Book ", false],
    ["Wake Up Early", true]
  ];

  void toggleCheck(bool? value, int index) {
    setState(() {
      remTasks[index][1] = !remTasks[index][1];
    });
  }

  void createRem() {
    showDialog(
      context: context,
      builder: (context) {
        return remBox();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      floatingActionButton: FloatingActionButton(
        onPressed: createRem,
        backgroundColor: Colors.lightGreen[300],
        child: Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: remTasks.length,
            itemBuilder: (context, index) {
              return remTile(
                taskName: remTasks[index][0],
                taskCompleted: remTasks[index][1],
                onChanged: (value) => toggleCheck(value, index),
              );
            },
          )),
    );
  }
}
