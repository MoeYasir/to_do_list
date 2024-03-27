import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];

  final mybox = Hive.box("mybox");
//inital data
  void createInitialData() {
    toDoList = [
      ["Make coffee", true],
      ["Go to gym", false]
    ];
  }

//load data to database:
  void loadData() {
    toDoList = mybox.get("TODOLIST");
  }

  //update the database
  void updateDataBase() {
    mybox.put("TODOLIST", toDoList);
  }
}
/*


[["Make coffee", true],     ["Go to gym", false]];

*/



