import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:navigation/controller.dart';
import 'package:navigation/message.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
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
  TextEditingController? _messageBox;
  String _lampImage = 'images/lamp_on.png';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _messageBox = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        // 바로 써줘야 네비게이셔 사용할 수 있다..? 잘 못들었따.
        leading: Material(
            child: IconButton(
                onPressed: () {
                  print('Home button is clicked!');
                },
                icon: Icon(Icons.home))),
        middle: Text(
          'Main 화면',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        trailing: Material(
          child: IconButton(
              onPressed: () {
                // 다른 화면으로 넘어갈 떄 Stataic을 이용해서 값을 주고 받을 거다.
                Message.contents = _messageBox!.text.trim();
                Navigator.push(context, CupertinoPageRoute(builder: (context) {
                  return Controller(); // 만들어 줄 함수이름.
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
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 55,
                      ),
                      Text(
                        'Message',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: CupertinoTextField(
                    controller: _messageBox,
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    keyboardType: TextInputType.text,
                    placeholder: 'Message를 입력하세요!',
                  ),
                  width: 300,
                ),
                Image.asset(
                  _lampImage,
                  width: 150,
                  height: 300,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void getData() {
    _messageBox!.text = Message.contents;
    if (Message.lampStatus) {
      setState(() {
        _lampImage = 'images/lamp_on.png';
      });
    } else {
      setState(() {
        _lampImage = 'images/lamp_off.png';
      });
    }
  }
} // =========
