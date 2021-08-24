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
  TextEditingController? _num1;
  TextEditingController? _num2;
  TextEditingController? _addResult;
  TextEditingController? _subResult;
  TextEditingController? _mulResult;
  TextEditingController? _divResult;
  late String num1;
  late String num2;
  late String addResult;
  late String subResult;
  late String mulResult;
  late String divResult;
  String resultMessage = '숫자를 입력하세요';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _num1 = TextEditingController();
    _num2 = TextEditingController();
    _addResult = TextEditingController();
    _subResult = TextEditingController();
    _mulResult = TextEditingController();
    _divResult = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('첫번째 숫자 :'),
                        width: 90,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _num1,
                          keyboardType: TextInputType.number,
                          placeholder: '숫자를 입력하세요!',
                          textAlign: TextAlign.end,
                        ),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('두번째 숫자 :'),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _num2,
                          keyboardType: TextInputType.number,
                          placeholder: '숫자를 입력하세요!',
                          textAlign: TextAlign.end,
                        ),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                CupertinoButton(
                  child: Text('계산하기'),
                  onPressed: () {
                    setState(() {
                      num1 = _num1!.text;
                      num2 = _num2!.text;
                      addResult =
                          (int.parse(num1) + int.parse(num2)).toString();
                      subResult =
                          (int.parse(num1) - int.parse(num2)).toString();
                      mulResult =
                          (int.parse(num1) * int.parse(num2)).toString();
                      divResult =
                          (double.parse(num1) / double.parse(num2)).toString();

                      _addResult!.text = addResult;
                      _subResult!.text = subResult;
                      _mulResult!.text = mulResult;
                      _divResult!.text = divResult;
                      resultMessage = '계산이 완료 되었습니다.';
                    });
                  },
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('덧셈 결과 :'),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _addResult,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.end,
                          readOnly: true,
                        ),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('뺼셈 결과 :'),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _subResult,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.end,
                          readOnly: true,
                        ),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('곱셈 결과 :'),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _mulResult,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          textAlign: TextAlign.end,
                        ),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text('나눗셈 결과 :'),
                        width: 90,
                      ),
                      Container(
                        child: CupertinoTextField(
                          controller: _divResult,
                          keyboardType: TextInputType.number,
                          readOnly: true,
                          textAlign: TextAlign.end,
                        ),
                        width: 150,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '$resultMessage',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
