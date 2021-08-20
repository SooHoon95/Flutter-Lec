import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for json

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
  String result = '';
  // List date = []; 또는
  late List date;

// 이 앱을 실행하자마자 제이슨을 가져와서 저장할 거야!
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    date = [];
    getJSONDate();
  }

//여기까지 아직 화면 안뜬 상태이다!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Json Exercise'),
      ),
      body: Container(
        // 젤 처음에 컨테이너를 쓰면 화면이 꽉채워준다. >> 기종 상관없이 모두 다 전부 꽉 채워준다는 뜻.
        child: Center(
          child: date.length == 0 // data 는 배열인데 값이 있는지 없는지 확인해보고.
              ? Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                )
              : ListView.builder(itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Code :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(date[index]['code'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Name :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(date[index]['name'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Dept :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(date[index]['dept'].toString()),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text(
                                "Phone :",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(date[index]['phone'].toString()),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
        ),
      ),
    );
  }

// Class 안에 함수를 사용하는 이유는 딱하나! setState를 사용하기 위해서
  Future<String> getJSONDate() async {
    var url = Uri.parse('http://localhost:8080/Flutter/student.json');
    var response = await http.get(url);
    // print(response.body) ;
    setState(() {
      // decode = 제이슨에서 [ 나 {} 같은 기호들 다 제외하고 가져온다.
      var dataConvertedJSON = json.decode(response.body);
      List result = dataConvertedJSON['results'];
      print("result : $result");
      date.addAll(result); // 가져온 데이터들 한번에 다 넣는다.
    });

    return "a";
  }
}
