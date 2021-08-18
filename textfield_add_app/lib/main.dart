import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int result = 0;

  TextEditingController textController1 = TextEditingController();
  late String num1;

  TextEditingController textController2 = TextEditingController();
  late String num2;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        result = 0;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 덧셈 계산기'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    "덧셈 결과 : $result",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextField(
                    controller: textController1,
                    decoration: InputDecoration(labelText: '숫자1을 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: TextField(
                    controller: textController2,
                    decoration: InputDecoration(labelText: '숫자2를 입력하세요'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (textController1.text == '' ||
                          textController1.text.isEmpty) {
                        errorSnackBar1(context);
                      } else if (textController2.text == '' ||
                          textController2.text.isEmpty) {
                        errorSnackBar2(context);
                      } else {
                        num1 = textController1.text;
                        num2 = textController2.text;

                        setState(() {
                          result = int.parse(num1) + int.parse(num2);
                        });
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        SizedBox(
                          width: 10,
                        ),
                        Text("덧셈 계산"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void errorSnackBar1(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('숫자1을 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}

void errorSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('숫자2를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
