import 'dart:ffi';

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
  List imageList = [
    "flower_01.png",
    "flower_02.png",
    "flower_03.png",
    "flower_04.png",
    "flower_05.png",
    "flower_06.png"
  ];
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Text(
                        imageList[count],
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('images/${imageList[count]}'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CupertinoButton(
                            child: Text('이전'),
                            onPressed: () {
                              setState(() {
                                btnPrev();
                              });
                            }),
                        CupertinoButton(
                            child: Text('다음'),
                            onPressed: () {
                              setState(() {
                                btnNext();
                              });
                            }),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void btnPrev() {
    if (count == 0) {
      count = 6;
    }
    count -= 1;
  }

  void btnNext() {
    if (count == 5) {
      count = -1;
    }
    count += 1;
  }
}
