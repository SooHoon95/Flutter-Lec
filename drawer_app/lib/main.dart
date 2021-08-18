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

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
        centerTitle: true, // or false,
        actions: [
          IconButton(
              onPressed: () {
                print("Shopping cart is clicked");
              },
              icon: Icon(Icons.shopping_cart)),
          IconButton(
              onPressed: () {
                print("Shopping cart is clicked");
              },
              icon: Icon(Icons.search)),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/001.png'),
                backgroundColor: Colors.white,
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: AssetImage('images/002.png'),
                  backgroundColor: Colors.white,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/003.png'),
                  backgroundColor: Colors.white,
                ),
              ],
              accountName: Text('pickachu'),
              accountEmail: Text('pikachu@naver.com'),
              onDetailsPressed: () {
                print("main page is clicked");
              },
              decoration: BoxDecoration(
                  color: Colors.red[400],
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0),
                  )),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('Home'),
              onTap: () {
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text('설정'),
              onTap: () {
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.black,
              ),
              title: Text('자주 묻는 질문'),
              onTap: () {
                print('Home is clicked');
              },
            )
          ],
        ),
      ),
    );
  }
}
