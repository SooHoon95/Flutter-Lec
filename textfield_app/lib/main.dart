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

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textContorller = TextEditingController();
  late String inputValye;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        // 화면 어디든 클릭하면 키보드 내려갈 수 있도록 확인해주는 애는
        // GestureDetector다. 이걸 위해서 스캐폴드를 제스처 디텍터로 감싸준다.
        appBar: AppBar(
          title: Text('Single TextField'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                    // 텍스트 필드는 컨트롤러를 정의해야한다.
                    controller: textContorller,
                    decoration: InputDecoration(labelText: '글자를 입력하세요'),
                    keyboardType: TextInputType.text),
                ElevatedButton(
                    onPressed: () {
                      if (textContorller.text == '' ||
                          textContorller.text.isEmpty) {
                        errorSnackBar(context);
                      } else {
                        inputValye = textContorller.text;
                        showSnackBar(context, inputValye);
                      }
                    },
                    child: Text('출력'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void errorSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('글자를 입력하세요!'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ),
  );
}

void showSnackBar(BuildContext context, String inputValue) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('입력한 글자는 $inputValue 입니다.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    ),
  );
}
