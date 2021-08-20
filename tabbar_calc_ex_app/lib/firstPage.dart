import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
            children: [
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
                  child: Text('덧셈 계산')),
              SizedBox(
                height: 30,
              ),
              Text(
                '입력하신 숫자의 합은 $result 입니다.',
                style: TextStyle(fontSize: 20, color: Colors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
