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
  String buttonText = "Hello";
  Color _color = Colors.blue;
  late Color
      _tempColor; // late >>> 지금은 값이 없지만 나중에 써줄거다. dart언어에만 있는거. 하지만 반드시 나주에 값을 넣어주어야한다.
  var switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change button color & text"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(_color),
                ),
                child: Text('$buttonText')),
            Switch(
              value: switchValue,
              onChanged: (value) {
                setState(() {
                  if (value == false) {
                    switchValue = value;
                    buttonText = 'Hello';
                    _color = Colors.blue;
                  } else {
                    switchValue = value;
                    buttonText = 'Flutter';
                    _color = Colors.red;
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
