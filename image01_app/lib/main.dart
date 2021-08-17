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
      backgroundColor: Colors.red[200],
      appBar: AppBar(
        title: Text('Image 01'),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/001.png'),
              radius: 50.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/002.png'),
              radius: 50.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('images/003.png'),
              radius: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
