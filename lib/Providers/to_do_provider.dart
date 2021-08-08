import 'package:untitled_todo/Models/task_model.dart';
import 'package:untitled_todo/helpers/dbHelper.dart';

class TodoProvider {
  String test ='Mohammed SH';
  List<Task_model> alltasks;
  getAllTasks()async{
   this.alltasks= await DbHelper.dbHelper.getAllTasks();
  }
  insertTasks(Task_model task_model)async{
    await DbHelper.dbHelper.createNewTask(task_model);
    getAllTasks();
  }
  deleteTask(Task_model task_model)async{
    await DbHelper.dbHelper.deleteTask(task_model);
    getAllTasks();
  }
  updateTask(Task_model task_model)async{
    await DbHelper.dbHelper.updateTask(task_model);
    getAllTasks();
  }
}