import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist_app/login.dart';
import 'package:todolist_app/tasks.dart';

void main() {
  runApp(
    ChangeNotifierProvider<UserTheme>(
      create: (context) => UserTheme(), // Créez ici une instance de UserTheme
      child:
          MyApp(), // Replacez MyApp par le widget racine de votre application
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
        scaffoldBackgroundColor: const Color.fromARGB(255, 143, 143, 193),
        appBarTheme: const AppBarTheme(elevation: 0),
        useMaterial3: true,
      ),
      home: Login(),
    );
  }
}

class UserTheme extends ChangeNotifier {
  int count;
  Color backgroundColor;

  UserTheme({this.count = 5, this.backgroundColor = Colors.black});

  void incrementCount() {
    count++;
    notifyListeners();
  }

  void changeBackgroundColor(Color bgColor) {
    backgroundColor = bgColor;
    notifyListeners();
  }
}


