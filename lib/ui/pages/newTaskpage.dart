import 'package:flutter/material.dart';
import 'package:untitled_todo/Models/task_model.dart';

class newTaskpage extends StatefulWidget {
  Function insert;

  newTaskpage(this.insert);

  @override
  _newTaskpageState createState() => _newTaskpageState();
}

class _newTaskpageState extends State<newTaskpage> {
  bool isComplete = false;

  String taskName;

  SaveTask() {
    widget.insert(Task_model(taskName: taskName, isComplete: isComplete));
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
                value: isComplete,
                onChanged: (v) {
                  this.isComplete = v;
                  setState(() {});
                }),
            RaisedButton(
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
