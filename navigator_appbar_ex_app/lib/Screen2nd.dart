import 'package:flutter/material.dart';

class Screen2nd extends StatelessWidget {
  const Screen2nd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('2nd Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('관우가 받은 편지'),
            Text('유비가 받은 편지'),
            Text('장비가 받은 편지'),
          ],
        ),
      ),
    );
  }
}
