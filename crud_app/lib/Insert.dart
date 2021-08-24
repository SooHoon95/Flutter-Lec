import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
      home: InsertAction(),
    );
  }
}

class InsertAction extends StatefulWidget {
  const InsertAction({Key? key}) : super(key: key);

  @override
  _InsertActionState createState() => _InsertActionState();
}

class _InsertActionState extends State<InsertAction> {
  late TextEditingController _codeController;
  late TextEditingController _nameController;
  late TextEditingController _deptController;
  late TextEditingController _phoneController;
  late String code;
  late String name;
  late String dept;
  late String phone;

  String result = '';
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _codeController = TextEditingController();
    _nameController = TextEditingController();
    _deptController = TextEditingController();
    _phoneController = TextEditingController();

    data = [];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Insert & return for Crud'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: _codeController,
                    decoration: InputDecoration(labelText: '학번을 입력하세요'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: '이름을 입력하세요'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _deptController,
                    decoration: InputDecoration(labelText: '전공을 입력하세요'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: '전화번호를 입력하세요'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (_codeController.text == '' ||
                            _codeController.text.isEmpty ||
                            _nameController.text == '' ||
                            _nameController.text.isEmpty ||
                            _deptController.text == '' ||
                            _deptController.text.isEmpty ||
                            _phoneController.text == '' ||
                            _phoneController.text.isEmpty) {
                          _showErrorSnackBar(context);
                        } else {
                          code = _codeController.text;
                          name = _nameController.text;
                          dept = _deptController.text;
                          phone = _phoneController.text;
                          insertJSONDate();
                        }
                      });
                    },
                    child: Text('입력'),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void insertJSONDate() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_insert_return_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    var response = await http.get(url);
    print(response.body);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      result = dataConvertedJSON['result'];
      print("result : $result");
    });

    if (result == 'OK') {
      _showDialog(context);
    } else {
      _showErrorSnackBar(context);
    }
  }
}

void _showDialog(BuildContext context) {
  //다이얼로그 띄우기
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '입력 결과',
            style: TextStyle(fontSize: 20.0),
          ),
          content: Text('입력이 완료 되었습니다.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      });
}

void _showErrorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('사용자 정보입력에 문제가 발생 하였습니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}
