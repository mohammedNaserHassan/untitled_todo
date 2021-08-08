import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled_todo/Providers/to_do_provider.dart';
import 'package:untitled_todo/helpers/dbHelper.dart';
import 'package:untitled_todo/ui/mainPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDataBase();
  runApp(ChangeNotifierProvider<TodoProvider>(
      create: (context) => TodoProvider(),
      child: MaterialApp(home: MyHomePage())
  )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Test Provider'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              Provider.of<TodoProvider>(context).test,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<TodoProvider>(context, listen: false)
                    .changeTestName('Saleem DB');
                print(Provider.of<TodoProvider>(context, listen: false).test);
              },
              child: Text('Change Provider value'),
            ),
          ],
        ),
      ),
    );
  }
}
