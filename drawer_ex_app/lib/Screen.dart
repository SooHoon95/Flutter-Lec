import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({Key? key}) : super(key: key);

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
                Icons.email,
                color: Colors.blue,
              ),
              title: Text('보낸 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/sendMessage');
                print('Home is clicked');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.email,
                color: Colors.grey,
              ),
              title: Text('받는 편지함'),
              onTap: () {
                Navigator.pushNamed(context, '/receiveMessage');
                print('Home is clicked');
              },
            )
          ],
        ),
      ),
    );
  }
}
