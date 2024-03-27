import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:to_do_project/data/database.dart';

class ToDoTile extends StatelessWidget {
  final String taskContent;
  final bool taskCompleted;
  final Function(BuildContext)? deleteFunction;
  final Function(bool?)? checkBoxFunction;
  const ToDoTile(
      {super.key,
      required this.checkBoxFunction,
      required this.deleteFunction,
      required this.taskContent,
      required this.taskCompleted});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),
        child: Container(
          height: 100,
          width: 350,
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                Checkbox(
                    activeColor: Colors.black,
                    value: taskCompleted,
                    onChanged: checkBoxFunction),
                Text(
                  taskContent,
                  style: TextStyle(
                      decoration: taskCompleted
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
