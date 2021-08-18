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
        title: Text('Alert Dialog with Gesture'), // 글자 클릭이니까 제스쳐다
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            _showDialog(context); // _로 시작하는 게 private 이다.
          },
          child: Text('Move the 2nd Page'),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context) {
  // BuildContext 는 타입
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Alert Tilte"),
        content: Text('Hello world ! 를 터치했습니다.'),
        actions: [
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Go to Page2'),
          ),
        ],
      );
    },
  );
}
