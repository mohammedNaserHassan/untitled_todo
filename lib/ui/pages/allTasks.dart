import 'package:flutter/material.dart';
import 'package:untitled_todo/Models/task_model.dart';
import 'package:untitled_todo/Widgets/task_widgets.dart';

class AllTasks extends StatelessWidget {
  List<Task_model> tasks;
  Function deleteFun, updateFun;

  AllTasks(this.tasks, this.deleteFun, this.updateFun);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(tasks[index], updateFun, deleteFun);
      },
    );
  }
}
