import 'package:flutter/material.dart';
import 'package:untitled_todo/Models/task_model.dart';
import 'package:untitled_todo/helpers/dbHelper.dart';
import 'package:untitled_todo/ui/pages/allTasks.dart';
import 'package:untitled_todo/ui/pages/comleteTasks.dart';
import 'package:untitled_todo/ui/pages/inCompleteTasks.dart';
import 'package:untitled_todo/ui/pages/newTaskpage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  insertNewTask(Task_model task_model) async {
    await DbHelper.dbHelper.createNewTask(task_model);
    getAllTasks();
  }

  getAllTasks() async {
    List<Task_model> tasks = await DbHelper.dbHelper.getAllTasks();
    this.tasks = tasks;
    setState(() {});
  }

  deleteTask(Task_model task_model) async {
    await DbHelper.dbHelper.deleteTask(task_model);
    getAllTasks();
  }

  updateTask(Task_model task_model) async {
    await DbHelper.dbHelper.updateTask(task_model);
    getAllTasks();
  }

  List<Task_model> tasks;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (x) => newTaskpage(insertNewTask)));
                  },
                  icon: Icon(Icons.add))
            ],
            title: Text('ToDo List'),
            bottom: TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'All Tasks'),
                Tab(
                  text: 'Complete Tasks',
                ),
                Tab(
                  text: 'InComplete Tasks',
                ),
              ],
            ),
          ),
          body: this.tasks == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(
                  children: [
                    AllTasks(tasks, deleteTask, updateTask),
                    ComleteTasks(tasks, deleteTask, updateTask),
                    InComleteTasks(tasks, deleteTask, updateTask)
                  ],
                )),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1)).then((value) => getAllTasks());
  }
}
