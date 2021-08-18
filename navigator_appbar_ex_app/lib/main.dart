import 'package:flutter/material.dart';
import 'package:navigator_appbar_ex_app/Screen2nd.dart';

import 'Screen.dart';
import 'Screen1st.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: "/main", routes: {
      '/main': (context) {
        return Screen();
      },
      '/1st': (context) {
        return Screen1st();
      },
      '/2nd': (context) {
        return Screen2nd();
      }
    });
  }
}
