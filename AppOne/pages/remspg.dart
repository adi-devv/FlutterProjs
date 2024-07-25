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
  final _controller = TextEditingController();
  List remList = [
    ["Make App", false],
    ["Read Book ", false],
    ["Wake Up Early", true]
  ];

  void toggleCheck(bool? value, int index) {
    setState(() {
      remList[index][1] = !remList[index][1];
    });
  }

  void addRem() {
    setState(() {
      remList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
  }

  void createRem() {
    _controller.text = "";
    showDialog(
      context: context,
      builder: (context) {
        return remBox(
          controller: _controller,
          onSave: addRem,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void deleteRem(int index){
    setState(() {
      remList.removeAt(index);
    });
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
            itemCount: remList.length,
            itemBuilder: (context, index) {
              return remTile(
                taskName: remList[index][0],
                taskCompleted: remList[index][1],
                onChanged: (value) => toggleCheck(value, index),
                delFunc: (context) => deleteRem(index),
              );
            },
          )),
    );
  }
}
