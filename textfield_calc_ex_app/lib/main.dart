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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController num1Controlelr = TextEditingController();
  TextEditingController num2Controlelr = TextEditingController();

  TextEditingController addControlelr = TextEditingController();
  TextEditingController subControlelr = TextEditingController();
  TextEditingController mulControlelr = TextEditingController();
  TextEditingController divControlelr = TextEditingController();

  int addResult = 0;
  int subResult = 0;
  int mulResult = 0;
  double divResult = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('간단한 계산기'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: num1Controlelr,
                  decoration: InputDecoration(labelText: '숫자 1을 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: num2Controlelr,
                  decoration: InputDecoration(labelText: '숫자 2를 입력하세요'),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          if (num1Controlelr.text == '' ||
                              num1Controlelr.text.isEmpty) {
                            errorSnackBar1(context);
                          } else if (num2Controlelr.text == '' ||
                              num2Controlelr.text.isEmpty) {
                            errorSnackBar2(context);
                          }
                          setState(() {
                            addResult = int.parse(num1Controlelr.text) +
                                int.parse(num2Controlelr.text);
                            print(addResult);
                            subResult = int.parse(num1Controlelr.text) -
                                int.parse(num2Controlelr.text);
                            mulResult = int.parse(num1Controlelr.text) *
                                int.parse(num2Controlelr.text);
                            divResult = double.parse(num1Controlelr.text) /
                                double.parse(num2Controlelr.text);

                            // addControlelr = addResult as TextEditingController;
                            addControlelr.text = '$addResult';
                            subControlelr.text = '$subResult';
                            mulControlelr.text = '$mulResult';
                            divControlelr.text =
                                '${divResult.toStringAsFixed(3)}';
                          });
                        },
                        child: Text('계산하기')),
                    SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          num1Controlelr.text = '';
                          num2Controlelr.text = '';
                          addControlelr.text = '';
                          subControlelr.text = '';
                          mulControlelr.text = '';
                          divControlelr.text = '';
                        });
                      },
                      child: Text('지우기'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.redAccent)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: addControlelr,
                  decoration: InputDecoration(labelText: '덧셈 결과'),
                  readOnly: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: subControlelr,
                  decoration: InputDecoration(labelText: '뺄셈 결과'),
                  readOnly: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: mulControlelr,
                  decoration: InputDecoration(labelText: '곱셈 결과'),
                  readOnly: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: divControlelr,
                  decoration: InputDecoration(labelText: '나눗셈 결과'),
                  readOnly: true,
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
