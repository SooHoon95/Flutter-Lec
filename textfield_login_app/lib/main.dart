import 'package:flutter/material.dart';

import 'package:textfield_login_app/bitCoin.dart';
import 'package:textfield_login_app/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String id = "aaa";
  String pw = "qwer1234";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return MyHomePage(id: id, pw: pw);
        },
        '/1st': (context) {
          return BitCoin(id: id);
        },
      },
    );
  }
}
