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
  TextEditingController searchController = TextEditingController();
  late String keyWord;
  int page = 0;
  late ScrollController _scrollController;
  // late EditingController _editController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data = [];
    // _editController = TextEditingController();
    searchController = TextEditingController();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      // 리스트의 마지막일 경우
      if (_scrollController.offset >=
              _scrollController.position.maxScrollExtent &&
          !_scrollController.position.outOfRange) {
        print('bototm');
        page++;     // 마지막 페이지며 페이지 수를 올려서 다음 데이텅를 불러온다.
        getJSONData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: (TextField(
          controller: searchController,
          decoration: InputDecoration(hintText: '검색어를 입력하세요'),
          keyboardType: TextInputType.text,
        )),
        actions: [
          GestureDetector(
            child: Icon(Icons.search),
            onTap: () {
              setState(() {
                keyWord = searchController.text.trim();
                data.clear();
                getJSONData();
              });
            },
          )
        ],
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    data[index]['title'].toString().length < 26
                                        ? Text(
                                            data[index]['title'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            data[index]['title']
                                                .toString()
                                                .replaceRange(
                                                    26,
                                                    data[index]['title']
                                                        .toString()
                                                        .length,
                                                    '...'),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    data[index]['authors'].toString().length <
                                            26
                                        ? Text(
                                            data[index]['authors'].toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          )
                                        : Text(
                                            data[index]['authors']
                                                .toString()
                                                .replaceRange(
                                                    26,
                                                    data[index]['authors']
                                                        .toString()
                                                        .length,
                                                    '...'),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data[index]['sale_price'].toString(),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      data[index]['status'].toString(),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.length,
                    controller: _scrollController,
                  )),
      ),

      // 애는 바디랑 떨어져 있는 애
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          page = 1;
          data.clear(); // List 비우기
          keyWord = searchController.text.trim();
          getJSONData();
        },
        child: Icon(Icons.file_download),
      ),
    );
  }

  Future<String> getJSONData() async {
    var url = Uri.parse(
        'https://dapi.kakao.com/v3/search/book?target=title&page=$page&query=$keyWord');
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
