import 'package:crud_app/Insert.dart';
import 'package:crud_app/Select.dart';
import 'package:crud_app/Update.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  String code = '';
  String name = '';
  String dept = '';
  String phone = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) {
          return Select();
        },
        '/insert': (context) {
          return InsertAction();
        },
        '/update': (context) {
          return UpdateAction(
            rcode: code,
            rname: name,
            rdept: dept,
            rphone: phone,
          );
        },
        // '/delete': (context) {
        //   return DeleteAction();
        // },
      },
    );
  }
}
