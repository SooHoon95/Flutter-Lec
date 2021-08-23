import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For Json

class UpdateAction extends StatefulWidget {
  final String rcode;
  final String rname;
  final String rdept;
  final String rphone;

  const UpdateAction(
      {Key? key,
      required this.rcode,
      required this.rname,
      required this.rdept,
      required this.rphone})
      : super(key: key);

  @override
  _UpdateActionState createState() =>
      _UpdateActionState(rcode, rname, rdept, rphone);
}

class _UpdateActionState extends State<UpdateAction> {
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

  _UpdateActionState(String rcode, String rname, String rdept, String rphone) {
    this.code = rcode;
    this.name = rname;
    this.dept = rdept;
    this.phone = rphone;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _codeController.text = this.code;
    _nameController.text = this.name;
    _deptController.text = this.dept;
    _phoneController.text = this.phone;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Insert % return for Crud'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              child: Column(
                children: [
                  TextField(
                    controller: _codeController,
                    decoration: InputDecoration(labelText: '학번'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(labelText: '이름'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _deptController,
                    decoration: InputDecoration(labelText: '전공'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: _phoneController,
                    decoration: InputDecoration(labelText: '전화번호'),
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (code == '' ||
                            name == '' ||
                            dept == '' ||
                            phone == '') {
                          _showErrorSnackBar(context);
                        } else {
                          code = _codeController.text;
                          name = _nameController.text;
                          dept = _deptController.text;
                          phone = _phoneController.text;
                          insertJSONDate();
                        }
                      });

                      //다이얼로그 띄우기
                      AlertDialog dialog = AlertDialog(
                        title: Text(
                          '입력 결과',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        content: Text('입력이 완료 되었습니다.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return dialog;
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

  Future<String> insertJSONDate() async {
    var url = Uri.parse(
        'http://localhost:8080/Flutter/student_update_flutter.jsp?code=$code&name=$name&dept=$dept&phone=$phone');
    var response = await http.get(url);
    print(response.body);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['results'];
      data.addAll(result);
    });

    late String returnValue; // 리턴 값
    if (data[0] == 'OK') {
      returnValue = 'OK';
    } else {
      returnValue = 'Fail';
      _showErrorSnackBar(context);
    }

    return returnValue;
  }
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
