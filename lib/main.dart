import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import "screens/home_page.dart";

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Common Application',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes:routes,
    );
  }
}