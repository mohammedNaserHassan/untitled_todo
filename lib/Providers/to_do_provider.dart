import 'package:flutter/foundation.dart';
import 'package:untitled_todo/Models/task_model.dart';
import 'package:untitled_todo/helpers/dbHelper.dart';

class TodoProvider extends ChangeNotifier {
  TodoProvider() {
    getAllTasks();
  }

  String test = 'Mohammed SH';
  List<Task_model> alltasks;
  List<Task_model> cmpletetasks;
  List<Task_model> incompletetasks;
  bool isComplete = false;
  changeIscomplete(bool isComplete){
    this.isComplete=isComplete;
    notifyListeners();
  }
  changeTestName(String test) {
    this.test = test;
    notifyListeners();
  }

  getAllTasks() async {
    this.alltasks = await DbHelper.dbHelper.getAllTasks();
    this.cmpletetasks =
        this.alltasks.where((element) => element.isComplete).toList();
    this.incompletetasks =
        this.alltasks.where((element) => !element.isComplete).toList();
    notifyListeners();
  }

  insertTasks(Task_model task_model) async {
    await DbHelper.dbHelper.createNewTask(task_model);
    getAllTasks();
  }

  deleteTask(Task_model task_model) async {
    await DbHelper.dbHelper.deleteTask(task_model);
    getAllTasks();
  }

  updateTask(Task_model task_model) async {
    await DbHelper.dbHelper.updateTask(task_model);
    getAllTasks();
  }
}
