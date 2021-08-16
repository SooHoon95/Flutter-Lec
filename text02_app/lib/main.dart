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

// 자세히 보면 글씨 정렬 조금씩 안맞음. 해결하기 위해서
// 컬럼 두개를 로우로 만들기
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Text wih Column amd Row"),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.email_rounded),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text("James"),
//               ],
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.account_balance),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text("Cathy")
//               ],
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.account_circle),
//                 SizedBox(
//                   width: 10.0,
//                 ),
//                 Text("Kenny")
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Text wih Column amd Row"),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.email_rounded),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_balance),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.account_circle),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("James"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Cathy"),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Kenny"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
