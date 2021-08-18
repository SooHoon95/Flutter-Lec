import 'package:flutter/material.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2nd'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Text(
        'Screen 2nd',
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
