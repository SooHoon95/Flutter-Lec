import 'package:flutter/material.dart';

import 'package:navigator_tabbar_ex_app/animalItem.dart';

class FirstPage extends StatelessWidget {
  // 일단 이쪽으로 넘어온 데이터를 바꿀 수 없도록 만든다. >> final
  final List<Animal> list;

  const FirstPage({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('First Page'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: ListView.builder(
            itemBuilder: (context, position) {
              return GestureDetector(
                // 리스트 뷰 모양을 카드모양으로 만들거야!
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        list[position].imagePath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.contain,
                      ),
                      Text(list[position].animalName),
                    ],
                  ),
                ),
                onTap: () {
                  _showDialog(
                      context,
                      list[position].kind,
                      list[position]
                          .animalName); // context = 현재 위치 라는 개념. 여기서는.
                },
              );
            },
            itemCount: list.length,
          ),
        ),
      ),
    );
  }
}

void _showDialog(BuildContext context, String kind, String name) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$name"),
          content: Text("이 동물은 $kind 입니다. "),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // 떠 있는 화면 지워지기
                },
                child: Text('종료'))
          ],
        );
      });
}
