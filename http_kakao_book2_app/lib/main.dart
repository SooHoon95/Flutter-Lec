import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // for Json

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
  String result = '';
  late List data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    getJSONData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Http Exercise'),
      ),
      body: Container(
        child: Center(
            child: data.length == 0
                ? Text(
                    'No Data',
                    style: TextStyle(fontSize: 20.0),
                    textAlign: TextAlign.center,
                  )
                : ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Container(
                          child: Row(
                            children: [
                              Image.network(
                                data[index]['thumbnail'],
                                height: 150,
                                width: 100,
                                fit: BoxFit.contain,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      data[index]['title'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['authors'].toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['sale_price'].toString()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(data[index]['status'].toString())
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                  )),
      ),

      // 애는 바디랑 떨어져 있는 애
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&query=플러터');
    var response = await http.get(url,
        headers: {"Authorization": "KakaoAK 3ef8d2126c6ea045fa30431408b8424a"});
    print(response.body);

    setState(() {
      var dataConvertedJSON = json.decode(utf8.decode(response.bodyBytes));
      List result = dataConvertedJSON['documents'];
      print('result : $result');
      data.addAll(result);
    });
    return "Success";
  }
}
