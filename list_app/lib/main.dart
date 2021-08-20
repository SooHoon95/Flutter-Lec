import 'package:flutter/material.dart';
import 'package:list_app/firstPage.dart';
import 'package:list_app/flagItems.dart';
import 'package:list_app/secondPage.dart';
import 'package:list_app/animalItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController controller; // late 이따가 값 넣어줄게에 하는 거
  List<Animal> animalList = [];
  List<Flag> flagList = [];

  @override
  void initState() {
    // 앱이 시작할 떄
    // ignore: todo
    // TODO: implement initState
    super.initState();
    //탭이 2개짜리다 라는 말
    controller = TabController(
        length: 2, vsync: this); // 탭 컨트롤러가 첫 페이지 두번쨰 페이지 다 들어간다는 뜻. >> this
    // Animal list
    animalList.add(Animal(
        animalName: '벌',
        kind: '곤충',
        imagePath: 'images/bee.png',
        flyExist: true));
    animalList.add(Animal(
        animalName: '고양이',
        kind: '포유류',
        imagePath: 'images/cat.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '젖소',
        kind: '포유류',
        imagePath: 'images/cow.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '강아지',
        kind: '포유류',
        imagePath: 'images/dog.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '여우',
        kind: '포유류',
        imagePath: 'images/fox.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '원숭이',
        kind: '영장류',
        imagePath: 'images/monkey.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '돼지',
        kind: '포유류',
        imagePath: 'images/pig.png',
        flyExist: false));
    animalList.add(Animal(
        animalName: '늑대',
        kind: '포유류',
        imagePath: 'images/wolf.png',
        flyExist: false));

    // Flag List
    flagList.add(Flag(
      flagName: 'Ameria',
      imagePath: 'flagimages/america.png',
    ));
    flagList.add(Flag(
      flagName: 'Austria',
      imagePath: 'flagimages/austria.png',
    ));
    flagList.add(Flag(
      flagName: 'belgium',
      imagePath: 'flagimages/belgium.png',
    ));
    flagList.add(Flag(
      flagName: 'canada',
      imagePath: 'flagimages/canada.png',
    ));
    flagList.add(Flag(
      flagName: 'china',
      imagePath: 'flagimages/china.png',
    ));
    flagList.add(Flag(
      flagName: 'estonia',
      imagePath: 'flagimages/estonia.png',
    ));
    flagList.add(Flag(
      flagName: 'france',
      imagePath: 'flagimages/france.png',
    ));
    flagList.add(Flag(
      flagName: 'germany',
      imagePath: 'flagimages/germany.png',
    ));
    flagList.add(Flag(
      flagName: 'greece',
      imagePath: 'flagimages/greece.png',
    ));
    flagList.add(Flag(
      flagName: 'hungary',
      imagePath: 'flagimages/hungary.png',
    ));
    flagList.add(Flag(
      flagName: 'italy',
      imagePath: 'flagimages/italy.png',
    ));
    flagList.add(Flag(
      flagName: 'Korea',
      imagePath: 'flagimages/korea.png',
    ));
    flagList.add(Flag(
      flagName: 'latvia',
      imagePath: 'flagimages/latvia.png',
    ));
    flagList.add(Flag(
      flagName: 'lithuania',
      imagePath: 'flagimages/lithuania.png',
    ));
    flagList.add(Flag(
      flagName: 'luxemburg',
      imagePath: 'flagimages/luxemburg.png',
    ));
    flagList.add(Flag(
      flagName: 'netherland',
      imagePath: 'flagimages/netherland.png',
    ));
    flagList.add(Flag(
      flagName: 'romania',
      imagePath: 'flagimages/romania.png',
    ));
    flagList.add(Flag(
      flagName: 'turkey',
      imagePath: 'flagimages/turkey.png',
    ));
  }

  @override
  void dispose() {
    // 앱이 정리 될때
    // ignore: todo
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Tab bar Test'),
      ),
      body: TabBarView(
        children: [
          FirstPage(
            // list 를 생성자를 통해서 데이터를 넘겨준다.
            list: animalList, // key와 벨류 값
          ),
          SecondPage(
            list: flagList,
          )
        ],
        controller: controller,
      ),
      bottomNavigationBar: TabBar(
        labelColor: Colors.blueAccent,
        tabs: [
          Tab(
            icon: Icon(
              Icons.looks_one,
              color: Colors.blue,
            ),
            // text: 'Page #1',
          ),
          Tab(
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
          ),
        ],
        // Design + controller 정의
        controller: controller,
      ),
    );
  }
}
