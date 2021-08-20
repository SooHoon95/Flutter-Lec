import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      // appBar: AppBar(
      //   title: Text('First Page'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/001.png'),
              radius: 50.0,
            ),
            SizedBox(
              height: 15.0,
            ),
            CircleAvatar(
                backgroundImage: AssetImage('images/002.png'), radius: 50.0),
            SizedBox(
              height: 15.0,
            ),
            CircleAvatar(
                backgroundImage: AssetImage('images/003.png'), radius: 50.0),
          ],
        ),
      ),
    );
  }
}
