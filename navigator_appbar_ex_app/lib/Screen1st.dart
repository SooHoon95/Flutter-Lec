import 'package:flutter/material.dart';

class Screen1st extends StatelessWidget {
  const Screen1st({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('1st Screen'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('관우가 보낸 편지'),
            Text('유비가 보낸 편지'),
            Text('장비가 보낸 편지'),
          ],
        ),
      ),
    );
  }
}
