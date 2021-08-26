import 'dart:async';

import 'package:date_picker/zeroFormat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

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
  String currentDateTime = "";
  bool _isRunnung = true;
  ZeroFormat zero = ZeroFormat();
  DateTime? chosenDateTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (!_isRunnung) {
        timer.cancel();
      }
      _addItem(); // 1초에 한번씩 addItem을 실행시킨다.
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('ko', 'KO'),
        const Locale('en', 'US'),
      ],
      home: CupertinoPageScaffold(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '현재 시간 : ' + currentDateTime,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    use24hFormat: true,
                    onDateTimeChanged: (value) {
                      chosenDateTime = value;
                    },
                  ),
                  width: 300,
                  height: 200,
                ),
              ),
              Text(
                  '선택시간 : ${chosenDateTime != null ? _chosenItem(chosenDateTime!) : "시간을 선택하였습니다."}')
            ],
          ),
        ),
      ),
    );
  }

  void _addItem() {
    final DateTime now = DateTime.now();
    setState(() {
      currentDateTime =
          ("${now.year}- ${zero.monthZero(now.month)}-${zero.dayZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.hourZero(now.hour)}:${zero.minZero(now.minute)}:${zero.secZero(now.second)}");
    });
  }

  String _chosenItem(DateTime now) {
    String chosenDateTime = '';
    setState(() {
      chosenDateTime =
          ("${now.year}-${zero.monthZero(now.month)}-${zero.monthZero(now.day)} ${_weekdayToString(now.weekday)} ${zero.monthZero(now.hour)}:${zero.monthZero(now.minute)}:${zero.monthZero(now.second)}");
    });
    return chosenDateTime;
  }

// 요일 숫자 아닌 글자로 나타내기
  String _weekdayToString(int weekday) {
    String dateName = "";

    switch (weekday) {
      case 1:
        dateName = "월";
        break;
      case 2:
        dateName = "화";
        break;
      case 3:
        dateName = "수";
        break;
      case 4:
        dateName = "목";
        break;
      case 5:
        dateName = "금";
        break;
      case 6:
        dateName = "토";
        break;
      case 7:
        dateName = "일";
    }
    return dateName;
  }
}// =--=