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
  혜화문	    37.5878892  / 127.003798
  흥인지문     37.5711907 / 127.009506
  창의문	    37.5926027 /	126.9664771
  숙정문      37.5956584 / 126.9810576

  */
  List latData = [37.5878892, 37.5711907, 37.5926027, 37.5956584];
  List longData = [127.003798, 127.009506, 126.9664771, 126.9810576];

  MapController mapController = MapController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: flutterMap());
  }

  Widget flutterMap() {
    return FlutterMap(
      mapController: mapController,
      options: MapOptions(
        center: latlng.LatLng(latData[0], longData[0]),
        zoom: 12.0,
      ),
      layers: [
        TileLayerOptions(
            urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
            subdomains: ['a', 'b', 'c'] //
            ),
        MarkerLayerOptions(markers: [
          for (int i = 0; i < 4; i++){
        latlngRepeat(i);
        };
        ])
      ],
    );
  }

  Marker latlngRepeat(int num) {


    return Marker(
      //마커 크기정하기
      width: 70,
      height: 70,
      point: latlng.LatLng(latData[i], longData[i]),
      builder: (ctx) => Container(
        child: Column(
          children: [
            Text(
              "숙정문",
              style: TextStyle(color: Colors.black, fontSize: 10.0),
            ),
            Icon(
              Icons.pin_drop_outlined,
              size: 50.0,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}// ======
