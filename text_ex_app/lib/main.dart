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
      debugShowCheckedModeBanner: false,
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
        title: Text("Text Exercise01"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5, // 두께
            ),
            Text("유비"),
            Text("관우"),
            Text("장비"),
            // SizedBox(
            //   height: 50.0,
            // ),
            Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5, // 두께
            ),
            Text(
              "조조",
              style: TextStyle(
                color: Colors.blue,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ), // 조 하고 조 사이 떨어지게
            ),
            Text("여포"),
            Text("동탁"),
            Divider(
              height: 30.0,
              color: Colors.grey[700],
              thickness: 0.5, // 두께
            ),
          ],
        ),
      ),
    );
  }
}
