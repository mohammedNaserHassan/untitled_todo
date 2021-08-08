import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_todo/Providers/to_do_provider.dart';
import 'package:untitled_todo/helpers/dbHelper.dart';
import 'package:untitled_todo/ui/mainPage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
await DbHelper.dbHelper.initDataBase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TodoProvider>(
      create: (context)=>TodoProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      ),
    );
  }
}

