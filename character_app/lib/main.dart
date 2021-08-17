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
      backgroundColor: Colors.orange[400],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text('영웅 card'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('images/general.png'),
                radius: 65.0,
              ),
              Divider(
                height: 50.0,
                color: Colors.black,
                thickness: 0.5,
              ),
              Row(
                children: [
                  Text(
                    '성웅',
                    style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 2.0,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    '이순신 장군',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 10.0,
              ),
              Row(
                children: [
                  Text(
                    '전적',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  Text(
                    '62전 62승',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('옥포해전'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('사천포해전'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('당포해전'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('한산도 대첩'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('부산포해전'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('명량해전'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.check_circle_outline_rounded),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text('노량해전'),
                ],
              ),
              Image.asset(
                'images/tuttle.gif',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.scaleDown,
              )
            ],
          ),
        ),
      ),
    );
  }
}
