import 'package:flutter/material.dart';
import 'package:simple_gesture_detector/simple_gesture_detector.dart';

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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> imageName = [
    'flower_01.png',
    'flower_02.png',
    'flower_03.png',
    'flower_04.png',
    'flower_05.png',
    'flower_06.png',
  ];

  int currentImage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Swiping'),
      ),
      backgroundColor: Colors.amber,
      body: Center(
        child: SimpleGestureDetector(
          onHorizontalSwipe: _onHorizontalSwipe, // 가로 스와이프 정의
          // onVerticalSwipe: _onVerticalSwipe, // 세로 스와이프 정의
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(imageName[currentImage]),
              ),
              Image.asset(
                'images/${imageName[currentImage]}',
                width: 350.0,
                height: 600.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 클라스 안쪽에 들어가 있어야한다.
  void _onHorizontalSwipe(SwipeDirection direction) {
    setState(() {
      if (direction == SwipeDirection.left) {
        print('left');
        currentImage += 1;
        if (currentImage >= imageName.length) {
          currentImage = 0;
        }
      } else {
        print("Right");
        if (currentImage < 0) {
          currentImage = imageName.length - 1;
        }
      }
    });
  }
}
