import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
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
  // setState에서 이 모양을 바꿔줄거다.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('http Exercise'),
      ),
      body: Container(
        child: Center(
          child: Text('$result'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // 어싱크로 돌릴거야.
        onPressed: () async {
          // 지금은 글자만 Uri 모습으로 파싱한 거다. >> Uri == Uniform resource information
          var url = Uri.parse('https://www.google.com');
          // await = 화면 구성 다한다음에 내가 제일 마지막에 구성된다. 라는 뜻.
          var response = await http.get(url);
          // 가지고 오면 html 이니까 html은 header 와 body로 구성되있는데,
          // 나는 바디만 가지고 올거야.
          setState(() {
            result = response.body;
            // setState에 넣어야 바뀐다.  ** setState에 넣는 애들은 전역변수로 넣어주는게 좋다.
          });
        },
        child: Icon(Icons.file_download),
      ),
    );
  }
}
