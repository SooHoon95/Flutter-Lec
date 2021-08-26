import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tab_bar/FirstPage.dart';
import 'package:tab_bar/SecondPage.dart';

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
  late CupertinoTabBar tabBar;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabBar = CupertinoTabBar(items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        label: 'Image View',
        icon: Icon(CupertinoIcons.star),
      ),
      BottomNavigationBarItem(
        label: 'Date Picker',
        icon: Icon(CupertinoIcons.book),
      )
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoTabScaffold(
        tabBar: tabBar,
        tabBuilder: (context, value) {
          if (value == 0) {
            return FirstPage(); // class 이름
          } else {
            return SecondPage();
          }
        },
      ),
    );
  }
}
