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
        title: Text('App bar Icon'),
        leading: IconButton(
            onPressed: () {
              print('Menu button is clicked ');
            },
            icon: Icon(Icons.menu)),
        actions: [
          IconButton(
            onPressed: () {
              print("Email button is clicked");
            },
            icon: Icon(Icons.email),
          ),
          IconButton(
            onPressed: () {
              print("Alram button is clicked");
            },
            icon: Icon(Icons.add_alarm),
          ),
          IconButton(
            onPressed: () {
              print("Add button is clicked");
            },
            icon: Icon(Icons.add_outlined),
          ),
          GestureDetector(
            onTap: () {
              print('Image button is clicked');
            },
            child: Image.asset(
              'images/001.png',
              width: 30,
              height: 30,
            ),
          ),
        ],
      ),
    );
  }
}
