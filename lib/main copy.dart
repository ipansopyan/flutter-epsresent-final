import 'package:flutter/material.dart';
import 'package:epresent/pages/login.page.dart';
import 'package:epresent/pages/dashboard.page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final String title='';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
      routes: <String,WidgetBuilder>{
        '/login' : (BuildContext context) => new LoginPage(),
        '/dashboard' : (BuildContext context) => new DashBoardPage(),
      },
    );
  }
}

