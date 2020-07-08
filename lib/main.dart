import 'package:example/Home.dart';
import 'package:flutter/material.dart';
import './launcher.dart';
import './login.dart';
import './Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LauncherPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => new LoginPage(),
        '/Home': (BuildContext context) => new Home(),
      },
    );
  }
}
