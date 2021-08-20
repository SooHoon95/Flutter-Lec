import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  TextEditingController num1Controller = TextEditingController();
  TextEditingController num2Controller = TextEditingController();

  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('탭바를 이용한 덧셈계산 비교'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('덧셈 결과 : $result'),
              TextField(
                controller: num1Controller,
                decoration: InputDecoration(labelText: '숫자 1을 입력하세요'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: num2Controller,
                decoration: InputDecoration(labelText: '숫자 1을 입력하세요'),
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (num1Controller.text == '' ||
                        num1Controller.text.isEmpty) {
                    } else if (num2Controller.text == '' ||
                        num2Controller.text.isEmpty) {}
                    result = int.parse(num1Controller.text.trim()) +
                        int.parse(num2Controller.text.trim());
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 15,
                    ),
                    Text('덧셈 계산')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
