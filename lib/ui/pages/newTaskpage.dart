import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_todo/Models/task_model.dart';
import 'package:untitled_todo/Providers/to_do_provider.dart';

class newTaskpage extends StatefulWidget {
  newTaskpage();

  @override
  _newTaskpageState createState() => _newTaskpageState();
}

class _newTaskpageState extends State<newTaskpage> {
  String taskName;

  SaveTask() {
    Provider.of<TodoProvider>(context, listen: false).insertTasks(Task_model(
        taskName: taskName,
        isComplete: Provider.of<TodoProvider>(context,listen: false).isComplete));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Task'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Text('Insert New Task'),
            TextField(
              onChanged: (v) {
                this.taskName = v;
              },
              decoration: InputDecoration(
                  labelText: 'Task Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
            Checkbox(
                value:  Provider.of<TodoProvider>(context).isComplete,
                onChanged: (v) {
                  Provider.of<TodoProvider>(context,listen: false).changeIscomplete(v);
                  setState(() {});
                }),
            ElevatedButton(
              onPressed: () {
                SaveTask();
              },
              child: Text('Insert New Task'),
            )
          ],
        ),
      ),
    );
  }
}
