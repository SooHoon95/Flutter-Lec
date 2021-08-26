import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_15_navigator_lamp_red_on_off/controller.dart';
import 'package:quiz_15_navigator_lamp_red_on_off/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _lampImage = 'images/lamp_on.png';
  bool _lampStatus = true;
  String _lampColor = "Yellow";
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Main 화면',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Material(
          child: IconButton(
              onPressed: () {
                Message.lampStatus = _lampStatus;
                Message.lampColor = _lampColor;
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return Controller();
                })).then((value) => getData());
              },
              icon: Icon(Icons.edit)),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  _lampImage,
                  width: 150,
                  height: 300,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void getData() {
    setState(() {
      _lampImage = Message.lampImage;
      _lampColor = Message.lampColor;
      _lampStatus = Message.lampStatus;
      print("lampImage: $_lampImage ");
      // print("lampColor : $_lampColor");
      // print("lampStatus : $_lampStatus");
    });
  }
}
