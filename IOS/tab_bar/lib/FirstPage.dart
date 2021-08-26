import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  String _lampImage = 'images/lamp_on.png';
  bool _lampStatus = true;
  String _lampSizeSatus = 'big';
  String _btnName = 'imag축소';
  double _imageWidth = 300;
  double _imageHeight = 450;

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
              children: [
                Container(
                  child: Image.asset(_lampImage),
                  width: _imageWidth,
                  height: _imageHeight,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CupertinoButton(
                        child: Text(_btnName),
                        onPressed: () {
                          setState(() {
                            btnAction();
                          });
                        }),
                    Column(
                      children: [
                        Text(
                          '전구 스위치',
                          style: TextStyle(
                            fontSize: 10,
                          ),
                        ),
                        CupertinoSwitch(
                            value: _lampStatus,
                            onChanged: (value) {
                              setState(() {
                                _lampStatus = value;
                                _switchAction();
                              });
                            }),
                      ],
                    )
                  ],
                )
              ],
            ))
          ],
        ),
      ),
    ));
  }

  void btnAction() {
    if (_lampSizeSatus == 'small') {
      _btnName = "Image 축소";
      _imageWidth = 300;
      _imageHeight = 450;
      _lampSizeSatus = 'big';
    } else {
      _lampSizeSatus = 'small';
      _btnName = "Image 확대";
      _imageWidth = 150;
      _imageHeight = 300;
    }
  }

  void _switchAction() {
    if (_lampStatus == true) {
      _lampImage = 'images/lamp_on.png';
    } else {
      _lampImage = 'images/lamp_off.png';
    }
  }
}
