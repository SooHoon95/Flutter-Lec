import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  String _lampImage = 'images/lamp_off.png';
  double _lampWidth = 150;
  double _lampHeight = 300;
  bool _lampSwitch = false;
  bool _sizeSwitch = false;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      _lampImage,
                      width: _lampWidth,
                      height: _lampHeight,
                    ),
                  ],
                ),
                width: 350,
                height: 650,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        '전구확대',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      CupertinoSwitch(
                          value: _sizeSwitch,
                          onChanged: (value) {
                            setState(() {
                              _sizeSwitch = value;
                              decisionSize();
                            });
                          })
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        '전구 스위치',
                        style: TextStyle(fontSize: 10.0),
                      ),
                      CupertinoSwitch(
                          value: _lampSwitch,
                          onChanged: (value) {
                            setState(() {
                              _lampSwitch = value;
                              dicisionOnOff();
                            });
                          })
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void decisionSize() {
    if (_sizeSwitch) {
      _lampWidth = 300;
      _lampHeight = 600;
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
    }
  }

  void dicisionOnOff() {
    if (_lampSwitch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }
}// End
