import 'package:flutter/material.dart';
import 'package:list_app/flagItems.dart';

class SecondPage extends StatelessWidget {
  final List<Flag> list;

  const SecondPage({Key? key, required this.list}) : super(key: key);

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
                      SizedBox(width: 10),
                      Text(
                        list[position].flagName,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  _showDialog(context,
                      list[position].flagName); // context = 현재 위치 라는 개념. 여기서는.
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

void _showDialog(BuildContext context, String name) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$name"),
          content: Text("이 국기는 $name 입니다. "),
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
