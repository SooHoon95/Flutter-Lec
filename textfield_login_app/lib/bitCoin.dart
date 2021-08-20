import 'package:flutter/material.dart';

class BitCoin extends StatelessWidget {
  final String id;
  const BitCoin({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          '$id 님 환영합니다!',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/bitcoin.png'),
              radius: 50.0,
            )
          ],
        ),
      ),
    );
  }
}
