import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  final String id;
  final String pw;
  const MyHomePage({Key? key, required this.id, required this.pw})
      : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController IDController = TextEditingController();
  TextEditingController PWController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Log in'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('images/001.png'),
                    backgroundColor: Colors.white,
                    radius: 70.0,
                  ),
                ),
                SizedBox(
                  height: 15.0,
        ``        ),
                TextField(
                  controller: IDController,
                  decoration: InputDecoration(labelText: '사용자 ID를 입력하세요.'),
                  keyboardType: TextInputType.text,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: PWController,
                  decoration: InputDecoration(labelText: '패스워드를 입력하세요.'),
                  // 텍스트필드 암호화
                  keyboardType: TextInputType.text,
                  obscureText: true,
                ),
                SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (IDController.text.isEmpty ||
                            IDController.text == '') {
                          _showErrorForID(context);
                        } else if (PWController.text.isEmpty ||
                            PWController.text == '') {
                          _showErrorForPW(context);
                        } else if (IDController.text != 'aaa' ||
                            PWController.text != 'qwer1234') {
                          _showErrorForMatch(context);
                        } else {
                          AlertDialog dialog = AlertDialog(
                            title: Text('환영합니다!'),
                            content: Text(
                              '신분이 확인되었습니다.',
                              style: TextStyle(fontSize: 15.0),
                            ),
                            actions: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.pushNamed(context, '/1st');
                                  },
                                  child: Text('OK'),
                                ),
                              )
                            ],
                          );
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return dialog;
                              });
                        }
                      });
                    },
                    child: Text('Log in'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _showErrorForID(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('Id를 입력해주세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}

void _showErrorForPW(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('PW를 입력해주세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}

void _showErrorForMatch(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('ID 또는 PW가 맞지 않습니다!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
