import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_15_navigator_lamp_red_on_off/message.dart';

class Controller extends StatefulWidget {
  const Controller({Key? key}) : super(key: key);

  @override
  _ControllerState createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  bool _colorSwitch = true;
  bool _switch = true;
  String _colorSwitchText = "Yellow";
  String switchText = "On";
  String lampImage = "";
  String lampColor = "Yellow";
  bool lampStatus = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (Message.lampStatus) {
      setState(() {
        _switch = true;
        switchText = "On";
      });
    } else {
      setState(() {
        _switch = false;
        switchText = "Off";
      });
    }

    setState(() {
      if (Message.lampColor == "Yellow") {
        _colorSwitch = true;
        _colorSwitchText = "Yellow";
      } else {
        _colorSwitch = false;
        _colorSwitchText = "Red";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoNavigationBarBackButton(
            previousPageTitle: 'Main 화면',
            onPressed: () {
              setState(() {
                print("lampImage in Controller : $lampImage");
                Message.lampImage = lampImage;
                Message.lampColor = lampColor;
                Message.lampStatus = lampStatus;
                print("Message.lampImage in Controller : ${Message.lampImage}");
                print("Message.lampColor in Controller : ${Message.lampColor}");
                Navigator.pop(context);
              });
            },
          ),
        ),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(55, 20, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    switchText,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  // OnOff Switch
                  CupertinoSwitch(
                      value: _switch,
                      onChanged: (value) {
                        _switch = value;
                        decisionOnOff();
                      }),
                  SizedBox(
                    width: 50,
                  ),
                  Text(_colorSwitchText),
                  SizedBox(
                    width: 10,
                  ),
                  // ColorSwitch
                  CupertinoSwitch(
                      value: _colorSwitch,
                      onChanged: (value) {
                        _colorSwitch = value;
                        decisionOnOff();
                      })
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  void decisionOnOff() {
    setState(() {
      if (_switch) {
        switchText = "On";
        lampStatus = true;
        decisionColor();
      } else {
        switchText = "Off";
        lampStatus = false;
        colorTextAction();
        lampImage = 'images/lamp_off.png';
      }
    });
  }

  void decisionColor() {
    setState(() {
      if (_colorSwitch) {
        _colorSwitchText = "Yellow";
        lampColor = "Yellow";
        lampImage = "images/lamp_on.png";
      } else {
        _colorSwitchText = "Red";
        lampColor = "Red";
        lampImage = "images/lamp_red.png";
      }
    });
  }

  void colorTextAction() {
    setState(() {
      if (_colorSwitch) {
        _colorSwitchText = "Yellow";
        lampColor = "Yellow";
      } else {
        _colorSwitchText = "Red";
        lampColor = "Red";
      }
    });
  }
}
