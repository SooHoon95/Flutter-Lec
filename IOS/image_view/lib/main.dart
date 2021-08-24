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
  String _lampImage = 'images/lamp_on.png';
  double _lampWidth = 150;
  double _lampHeight = 300;
  String _buttonName = "Image 확대";
  String _lampSizeStatus = "small";

  bool _switch = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // 전구의 크기는 달라지지만 그 틀은 크기가 일정하다.
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        _lampImage,
                        width: _lampWidth,
                        height: _lampHeight,
                      )
                    ]),
                width: 350,
                height: 650,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoButton(
                    child: Text('$_buttonName'),
                    onPressed: () {
                      setState(() {
                        decisionLampSize();
                      });
                    },
                  ),
                  Column(
                    children: [
                      Text(
                        '전구스위치',
                        style: TextStyle(fontSize: 12.0),
                      ),
                      CupertinoSwitch(
                          value: _switch,
                          onChanged: (value) {
                            setState(() {
                              _switch = value;
                              decisionOnOff();
                            });
                          })
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void decisionLampSize() {
    if (_lampSizeStatus == 'small') {
      _lampWidth = 300;
      _lampHeight = 600;
      _buttonName = "Image 축소";
      _lampSizeStatus = "large";
    } else {
      _lampWidth = 150;
      _lampHeight = 300;
      _buttonName = "Image 확대";
      _lampSizeStatus = "small";
    }
  }

  void decisionOnOff() {
    if (_switch) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }
}// End
