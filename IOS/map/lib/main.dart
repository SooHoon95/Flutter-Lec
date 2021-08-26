import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as latlng;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  /*
  서울상상나라	    37.54945787  / 127.0862609
  둘리뮤지엄        37.65243153 / 127.0276397
  서대문형무소역사관	37.57244171 /	126.9595412

  */

  int _kindChoice = 0; // Segmented Control 출발번호

  // Segment Widget
  Map<int, Widget> segmentWidgets = {
    // 0번이면 위젯을 불러라!
    0: SizedBox(
      child: Text(
        //Child가 있으면 나머지 위젯을 가져다 쓸수 있다는 뜻. sizedBox는 간격뿐아니라 Center처럼도 사용 가능하다.
        '서울상상나라',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    1: SizedBox(
      child: Text(
        //Child가 있으면 나머지 위젯을 가져다 쓸수 있다는 뜻. sizedBox는 간격뿐아니라 Center처럼도 사용 가능하다.
        '둘리뮤지엄',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
    ),
    2: SizedBox(
      child: Text(
        //Child가 있으면 나머지 위젯을 가져다 쓸수 있다는 뜻. sizedBox는 간격뿐아니라 Center처럼도 사용 가능하다.
        '서대문형무소역사관',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12),
      ),
      width: 120,
    ),
  };

  double latData = 37.54945787;
  double longData = 127.0862609;

  MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[50],
        title: Center(
          child: Column(
            children: [
              //cupertino를 Meterial과 같이 쓸 수 있다.
              CupertinoSegmentedControl(
                groupValue: _kindChoice,
                children: segmentWidgets,
                onValueChanged: (value) {
                  setState(() {
                    _kindChoice = value as int;
                    if (_kindChoice == 0) {
                      latData = 37.54945787;
                      longData = 127.0862609;
                      // 좌표 줬으니 움직이도록 한다.
                      mapController.move(latlng.LatLng(latData, longData),
                          17.0); // latlng는 import 값 변수 지정
                    } else if (_kindChoice == 1) {
                      latData = 37.65243153;
                      longData = 127.0276397;
                      // 좌표 줬으니 움직이도록 한다.
                      mapController.move(latlng.LatLng(latData, longData),
                          17.0); // latlng는 import 값 변수 지정

                    } else {
                      latData = 37.57244171;
                      longData = 126.9595412;
                      // 좌표 줬으니 움직이도록 한다.
                      mapController.move(latlng.LatLng(latData, longData),
                          17.0); // latlng는 import 값 변수 지정
                    }
                  });
                },
              )
            ],
          ),
        ),
        toolbarHeight: 100,
      ),
      body: flutterMap(),
    );
  }

  Widget flutterMap() {
    // body 에는 Widget이 들어가니까 타입은 Widget으로 한다.
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: latlng.LatLng(latData, longData),
        zoom: 17.0,
      ),
      // 그림을 그려서 넣어준다. 얘네는 정해진 애들이라 그대로 써줘야 한다.
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: [
              'a',
              'b',
              'c'
            ] // tilelayerOptions 왜 이렇게 쓰는지는 모르지만 정해져있는데로 쓰는 것 이해 ㄴㄴ
            ),
        MarkerLayerOptions(
          markers: [
            Marker(
                //마커 크기정하기
                width: 80,
                height: 80,
                point: latlng.LatLng(latData, longData),
                builder: (ctx) => Container(
                      child: Icon(
                        Icons.pin_drop_outlined,
                        size: 50.0,
                        color: Colors.red,
                      ),
                    ))
          ],
        )
      ],
    );
  }
} // End ==============
