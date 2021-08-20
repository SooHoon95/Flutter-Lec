import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      // appBar: AppBar(
      //   title: Text('Second Page'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/001.png'),
              radius: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/001.png'),
                  radius: 50.0,
                ),
                SizedBox(
                  width: 10.0,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/001.png'),
                  radius: 50.0,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
