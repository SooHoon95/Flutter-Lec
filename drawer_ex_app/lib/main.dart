import 'package:drawer_ex_app/Screen.dart';
import 'package:drawer_ex_app/getMessage.dart';
import 'package:drawer_ex_app/sendScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return Screen();
        },
        '/sendMessage': (context) {
          return SendScreen();
        },
        '/receiveMessage': (context) {
          return GetMessage();
        }
      },
    );
  }
}
