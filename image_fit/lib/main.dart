import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image fitting"),
      ),
      body: Center(
        child: Column(
          children: [
            Image.asset(
              'images/tuttle.gif',
              width: 50,
              height: 100.0,
            ),
            Image.asset(
              'images/tuttle.gif',
              width: 50.0,
              height: 100.0,
              fit: BoxFit.fill,
            ),
            Image.asset(
              'images/tuttle.gif',
              width: 50.0,
              height: 100.0,
              fit: BoxFit.contain,
            ),
            Image.asset(
              'images/tuttle.gif',
              width: 50.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            Image.asset('images/tuttle.gif',
                width: 50.0, height: 100.0, fit: BoxFit.fitWidth),
            Image.asset(
              'images/tuttle.gif',
              width: 50.0,
              height: 100.0,
              fit: BoxFit.scaleDown, // 전체 이미지 맞춰서 나오도록 자동으로
            ),
          ],
        ),
      ),
    );
  }
}
