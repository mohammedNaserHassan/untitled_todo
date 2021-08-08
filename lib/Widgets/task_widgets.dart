import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_todo/Models/task_model.dart';
import 'package:untitled_todo/Providers/to_do_provider.dart';

class TaskWidget extends StatelessWidget {
  Task_model task_model;

  TaskWidget(this.task_model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: task_model.isComplete ? Colors.green : Colors.redAccent,
          borderRadius: BorderRadius.circular(15)),
      child: Row(
        children: [
          Checkbox(
              value: task_model.isComplete,
              onChanged: (v) {
                task_model.isComplete = v;
                Provider.of<TodoProvider>(context, listen: false)
                    .updateTask(task_model);
              }),
          SizedBox(
            width: 10,
          ),
          Text(task_model.taskName),
          Spacer(),
          IconButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false)
                    .deleteTask(task_model);
              },
              icon: Icon(Icons.delete))
        ],
      ),
    );
  }
}
