import 'package:flutter/material.dart';

class GetMessage extends StatelessWidget {
  const GetMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1st'),
        backgroundColor: Colors.green,
      ),
      body: Center(
          child: Text(
        'Screen 1st',
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
