import 'package:flutter/material.dart';
import 'package:untitled_todo/Models/task_model.dart';
import 'package:untitled_todo/Widgets/task_widgets.dart';

class InComleteTasks extends StatelessWidget {
  List<Task_model> tasks;
  Function deleteFun, updateFun;

  InComleteTasks(this.tasks, this.deleteFun, this.updateFun);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.where((element) => !element.isComplete).length,
      itemBuilder: (context, index) {
        return TaskWidget(
            tasks.where((element) => !element.isComplete).toList()[index],
            updateFun,
            deleteFun);
      },
    );
  }
}
