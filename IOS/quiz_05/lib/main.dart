import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  TextEditingController? _multilines;
  TextEditingController? _signleline;
  int number = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _multilines = TextEditingController();
    _signleline = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
            child: Text(
              '여러줄 출력',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: CupertinoTextField(
                  controller: _signleline,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  keyboardType: TextInputType.number,
                ),
                width: 90,
              ),
              CupertinoButton(
                  child: Text('단 출력'),
                  onPressed: () {
                    setState(() {
                      insertLines();
                    });
                  })
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
            child: CupertinoTextField(
              controller: _multilines,
              maxLines: 10, // ***
              textAlign: TextAlign.left,
              decoration: BoxDecoration(color: Colors.amber[100]),
            ),
          )
        ]),
      )),
    );
  }

  void insertLines() {
    number = int.parse(_signleline!.text);
    for (var i = 1; i <= 9; i++) {
      _multilines!.text += '$number X $i = ${number * i}' + '\n';
    }
    // _multilines!.text += _signleline!.text + "\n";
  }
}
