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

// Column
// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Text Row"),
//         backgroundColor: Colors.blue,
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("James"),
//             SizedBox(
//               height: 20,
//             ),
//             Text('Cathy'),
//             SizedBox(
//               height: 20,
//             ),
//             Text('Kenny')
//           ],
//         ),
//       ),
//     );
//   }
// }

// Row
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Row"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("James"),
              SizedBox(
                width: 20,
              ),
              Text('Cathy'),
              SizedBox(
                width: 20,
              ),
              Text('Kenny')
            ],
          ),
        ),
      ),
    );
  }
}
