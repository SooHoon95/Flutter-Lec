import 'package:flutter/material.dart';
import 'package:navigator_tabbar_ex_app/listReady.dart';
import 'package:navigator_tabbar_ex_app/loginScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  String id = 'aaa';
  String pw = 'qwer1234';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return LoginScreen(
            id: id,
            pw: pw,
          );
        },
        '/loginSucess': (context) {
          return MyHomePage();
        }
      },
    );
  }
}
