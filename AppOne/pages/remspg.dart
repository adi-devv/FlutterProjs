// ignore_for_file: prefer_const_constructors

import 'package:appone/data/database.dart';
import 'package:appone/util/new_rem.dart';
import 'package:appone/util/rem_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RemsPg extends StatefulWidget {
  const RemsPg({super.key});

  @override
  State<RemsPg> createState() => _RemsPgState();
}

class _RemsPgState extends State<RemsPg> {
  final _myBox = Hive.box('mybox');
  remDatabase db = remDatabase();
  final _controller = TextEditingController();

  @override
  void initState(){
    if (_myBox.get("remList") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void toggleCheck(bool? value, int index) {
    setState(() {
      db.remList[index][1] = !db.remList[index][1];
    });
    db.updateDatabase();
  }

  void addRem() {
    setState(() {
      db.remList.add([_controller.text, false]);
    });
    Navigator.of(context).pop();
    db.updateDatabase();
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

  void deleteRem(int index) {
    setState(() {
      db.remList.removeAt(index);
    });
    db.updateDatabase();
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
            itemCount: db.remList.length,
            itemBuilder: (context, index) {
              return remTile(
                taskName: db.remList[index][0],
                taskCompleted: db.remList[index][1],
                onChanged: (value) => toggleCheck(value, index),
                delFunc: (context) => deleteRem(index),
              );
            },
          )),
    );
  }
}
