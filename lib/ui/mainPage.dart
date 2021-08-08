import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_todo/Providers/to_do_provider.dart';
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
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<TodoProvider>(context,listen: false).getAllTasks();
  }
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (x) => newTaskpage()));
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
            body: Provider
                .of<TodoProvider>(context)
                .alltasks == null
                ? Center(
              child: CircularProgressIndicator(),
            )
                : TabBarView(
              children: [
                AllTasks(),
                ComleteTasks(),
                InComleteTasks()
              ],
            )),
      )
    ;
  }

}

