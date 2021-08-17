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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Buttons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                print("Text Button");
              },
              onLongPress: () {
                print("Long Pressed Text Button");
              },
              child: Text(
                'Text Button',
                style: TextStyle(fontSize: 20.0),
              ),
              style: TextButton.styleFrom(
                primary: Colors.red,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                print("Elevated Button");
              },
              child: Text('Elevated button'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                print("outlined button");
              },
              child: Text('Outlined button'),
              style: OutlinedButton.styleFrom(
                primary: Colors.green,
                side: BorderSide(
                  color: Colors.black87,
                  width: 2.0,
                ),
              ),
            ),
            TextButton.icon(
              onPressed: () {
                print('Icon Button');
              },
              icon: Icon(
                Icons.home,
                size: 30.0,
              ),
              label: Text('Go Home'),
              style: TextButton.styleFrom(
                primary: Colors.purple,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print("Elevated Icon");
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text('Go Home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
            ),
            OutlinedButton.icon(
              onPressed: () {
                print('outlined icon');
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text('Go Home'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                onSurface: Colors.pink,
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                print("Elevated Icon");
              },
              icon: Icon(
                Icons.home,
                size: 20.0,
              ),
              label: Text('Go Home'),
              style: ElevatedButton.styleFrom(
                primary: Colors.pink[100],
                // onSurface: Colors.yellow,
              ),
            ),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              buttonPadding: EdgeInsets.all(20.0),
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Text Button'),
                ),
                ElevatedButton(onPressed: () {}, child: Text('Elevated Button'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
