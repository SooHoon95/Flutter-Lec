import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
  final Completer<WebViewController> _contrller =
      Completer<WebViewController>();

  bool isLoading = true; // for indicator

  TextEditingController urlController = TextEditingController();
  late String urlPath = 'www.daum.net';
  late String urlFinal = 'http://192.168.120.21:8080/';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[400],
          title: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: urlController,
              decoration: InputDecoration(
                hintText: 'Site이름을 입력하세요 !',
              ),
              keyboardType: TextInputType.text,
            ),
          ),

          actions: [
            GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                setState(() {
                  urlFinal = 'https://' + urlController.text.trim();
                  print(urlFinal);
                  _contrller.future.then((value) => value.loadUrl(urlFinal));
                });
              },
            )
          ],
          // title: Text('Web View'),
        ),
        body: Stack(
          children: [
            WebView(
              initialUrl: '$urlFinal',
              javascriptMode: JavascriptMode.unrestricted, // 자바 스크립트를 시작하겠다.
              onWebViewCreated: (WebViewController webViewController) {
                _contrller.complete(webViewController);
              },
              // 다 불러왔다!
              onPageFinished: (finish) {
                setState(() {
                  isLoading = false;
                });
              },
              onPageStarted: (start) {
                setState(() {
                  isLoading = true;
                });
              },
            ),
            //삼항 연산자 사용
            isLoading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Stack(),
          ],
        ),
        // Floating Button 그리기
        // Floating Button 이 현재 페이지의 모양을 알고 있어야 한다.
        floatingActionButton: FutureBuilder<WebViewController>(
            future: _contrller.future, // 미래를 예측하는 게 아니라 현재 페이지를 저장해서
            // 이 다음페이지에서 back 눌렀을때 이 페이지로 돌아오게 하는 기능
            builder: (BuildContext context,
                AsyncSnapshot<WebViewController> controller) {
              // 데이터가 들어왔니? 물어보기
              if (controller.hasData) {
                return FloatingActionButton(
                  onPressed: () {
                    // goback , goFoward 등 여러가지 있다.
                    controller.data!.goBack();
                  },
                  child: Icon(Icons.arrow_back),
                  backgroundColor: Colors.redAccent,
                );
              }
              return Container();
            }),
      ),
    );
  }
}
