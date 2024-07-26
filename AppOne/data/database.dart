import 'package:hive_flutter/hive_flutter.dart';

class remDatabase{

  List remList = [];
  final _myBox = Hive.box('mybox');

  void createInitialData(){
    remList = [
      ["Wake Up Early", true],
      ["Make App", false],
      ["Read Book ", false],
    ];
  }

  void loadData(){
    remList = _myBox.get('remList');
  }

  void updateDatabase(){
    _myBox.put("remList", remList);
  }
}