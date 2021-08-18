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
  TextEditingController textController = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  int result = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('간단한 덧셈 계산기'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "덧셈 결과 : $result",
                style: TextStyle(fontSize: 15.0),
              ),
              TextField(
                controller: textController,
                keyboardType: TextInputType.number,
              ),
              TextField(
                controller: textController2,
                keyboardType: TextInputType.number,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    result = int.parse(textController.text) +
                        int.parse(textController2.text);
                    print("result = $result ");
                  });
                },
                child: Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 20,
                    ),
                    Text('덧셈 계산'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
