import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  String _lampStatus = "on";
  String _lampImage = "images/lamp_on.png";
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              _lampImage,
              width: 300,
              height: 400,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoButton(
                    child: Text('켜기'),
                    onPressed: () {
                      setState(() {
                        print(_lampStatus);
                        _actionOnbutton();
                        print(_lampStatus);
                      });
                    }),
                CupertinoButton(
                    child: Text('끄기'),
                    onPressed: () {
                      setState(() {
                        _actionOffbutton();
                        print(_lampStatus);
                      });
                    }),
              ],
            )
          ],
        ),
      )),
    );
  }

  void _actionOnbutton() {
    if (_lampStatus == 'on') {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('경고'),
              content: Text('현재 ${_lampStatus} 상태 입니다.'),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('네, 알겠습니다.'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          });
    } else {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('램프켜기'),
              content: Text('램프를 켜시겠습니까?'),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('네'),
                    onPressed: () {
                      setState(() {
                        _lampImage = "images/lamp_on.png";
                        _lampStatus = "on";
                        print(_lampStatus);
                        Navigator.pop(context);
                      });
                    }),
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('아니오'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          });
    }
  }

  void _actionOffbutton() {
    if (_lampStatus == "off") {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('경고'),
              content: Text('현재 ${_lampStatus} 상태 입니다.'),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('네, 알겠습니다.'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          });
    } else {
      showCupertinoDialog(
          context: context,
          builder: (context) {
            return CupertinoAlertDialog(
              title: Text('램프끄기'),
              content: Text('램프를 끄시겠습니까?'),
              actions: [
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('네'),
                    onPressed: () {
                      setState(() {
                        _lampImage = "images/lamp_off.png";
                        _lampStatus = "off";
                        Navigator.pop(context);
                      });
                    }),
                CupertinoDialogAction(
                    isDefaultAction: true,
                    child: Text('아니오'),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          });
    }
  }
}
