import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_project/common_widgets/slidable_widget.dart';
import 'package:to_do_project/data/database.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ToDoDataBase db = ToDoDataBase();
  final mybox = Hive.box("mybox");
  TextEditingController taskController = TextEditingController();

  @override
  void initState() {
    if (mybox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    // TODO: implement initState
    super.initState();
  }

  void createNewTask() {
    setState(() {
      db.toDoList.add([taskController.text, false]);
      taskController.clear();
    });

    Navigator.pop(context);
    db.updateDataBase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        //Scaffold color
        backgroundColor: Colors.yellow[200],
        //App Bar
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.yellow,
          title: const Text(
            "To Do",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
        ),
        //Floating Action Button
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.yellow,
            child: const Icon(
              Icons.add,
              color: Colors.black,
              size: 30,
            ),
            //functionality of Floating Action Button
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        backgroundColor: Colors.yellow[200],
                        content: Container(
                          height: 120,
                          width: 200,
                          child: Column(
                            children: [
                              TextField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.yellow)),
                                    hintStyle: TextStyle(fontSize: 20),
                                    hintText: "Add a new task"),
                                controller: taskController,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  MaterialButton(
                                    elevation: 3,
                                    minWidth: 100,
                                    color: Colors.yellow,
                                    onPressed: createNewTask,
                                    child: const Text(
                                      "Save",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  MaterialButton(
                                    elevation: 3,
                                    minWidth: 100,
                                    color: Colors.yellow,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text(
                                      "Cancel",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
                  });
            }),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskContent: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              deleteFunction: (context) => setState(() {
                db.toDoList.removeAt(index);

                db.updateDataBase();
              }),
              checkBoxFunction: (value) => setState(() {
                db.toDoList[index][1] = !db.toDoList[index][1];

                db.updateDataBase();
              }),
            );
          },
        ));
  }
}
