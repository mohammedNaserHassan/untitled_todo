import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_todo/Providers/to_do_provider.dart';
import 'package:untitled_todo/Widgets/task_widgets.dart';

class InComleteTasks extends StatelessWidget {


  InComleteTasks();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: Provider.of<TodoProvider>(context).incompletetasks.length,
      itemBuilder: (context, index) {
        return TaskWidget(
            Provider.of<TodoProvider>(context).incompletetasks[index]
        );
      },
    );
  }
}
