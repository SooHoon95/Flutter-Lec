import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
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
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Alert와 Action Sheet',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CupertinoButton(
                    child: Text('Alert'),
                    onPressed: () {
                      setState(() {
                        _showAlert(tilte: "Title", message: "Messgae");
                      });
                    }),
                SizedBox(
                  width: 20,
                ),
                CupertinoButton(
                    child: Text('Action Sheet'),
                    onPressed: () {
                      setState(() {
                        _showActionSheet(tilte: "Title", message: "Messgae");
                      });
                    })
              ])
            ],
          ),
        ),
      ),
    );
  }

  void _showAlert({String? tilte, String? message}) {
    showCupertinoDialog(
        context:
            context, // context = 현재 화면의 상태, 정보, 메모리 위치를 알고있다. 그래야 그 위에다가 다이얼로그를 띄울 수 있다.
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(tilte!),
            content: Text(message!),
            actions: [
              CupertinoDialogAction(
                isDefaultAction: true,
                child: Text('Alert Default'),
                onPressed: () {
                  print('Alert : Action Default');
                  Navigator.pop(context);
                },
              ),
              // 빨간색 디스트럭트 버튼 ; Destruct 파괴하다.
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('Alert Destruct'),
                onPressed: () {
                  print('Alert : Action Destruct');
                  Navigator.pop(context);
                },
              ),
              // 굵은 글씨 cancel
              CupertinoDialogAction(
                child: Text(
                  'Alert Cancel',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  print('Alert : Action Default');
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void _showActionSheet({String? tilte, String? message}) {
    // 왜 중괄호에 넣는가?
    showCupertinoModalPopup(
        context:
            context, // context = 현재 화면의 상태, 정보, 메모리 위치를 알고있다. 그래야 그 위에다가 다이얼로그를 띄울 수 있다.
        builder: (context) {
          return CupertinoActionSheet(
            title: Text(tilte!),
            message: Text(message!),
            actions: [
              CupertinoActionSheetAction(
                isDefaultAction: true,
                child: Text('Action Default'),
                onPressed: () {
                  print('Alert : Action Default');
                  Navigator.pop(context);
                },
              ),
              // 빨간색 디스트럭트 버튼 ; Destruct 파괴하다.
              CupertinoActionSheetAction(
                isDestructiveAction: true,
                child: Text('Action Destruct'),
                onPressed: () {
                  print('Alert : Action Destruct');
                  Navigator.pop(context);
                },
              ),
            ],
            cancelButton: CupertinoActionSheetAction(
              child: Text(
                'Action Cancel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print("Alert : Action Destructive");
                Navigator.pop(context);
              },
            ),
          );
        });
  }
}//===============
