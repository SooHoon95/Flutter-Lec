import 'package:flutter/cupertino.dart';
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
  String title = "Welcome!";
  String name = 'suhun';
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
                Text('$title'),
                SizedBox(
                  height: 100,
                ),
                CupertinoButton(
                    child: Text('Name'),
                    onPressed: () {
                      setState(() {
                        if (count % 2 == 0) {
                          title = title + name;
                        } else {
                          title = "Welcome!";
                        }
                        count++;
                      });
                    })
              ],
            ),
          ),
        ],
      ),
    )));
  }
}
