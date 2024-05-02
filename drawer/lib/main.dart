import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
      initialRoute: '/homePage',
      routes: {
        MyHome.myRoute: (context) => MyHome(),
        MySetting.myRoute: (context) => MySetting(),
      },
    );
  }
}

class MyHome extends StatelessWidget {
  static const myRoute = '/homePage';
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Home'),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            height: 200,
            color: Colors.blue[400],
            child: Text('Navigation'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MyHome.myRoute);
            },
            leading: Icon(
              Icons.home,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MySetting.myRoute);
            },
            leading: Icon(
              Icons.settings,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
      ),
      body: const Center(
        child: Text('My Home'),
      ),
    );
  }
}

class MySetting extends StatelessWidget {
  static const myRoute = '/settingPage';
  const MySetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Settings'),
      ),
      drawer: Drawer(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            height: 200,
            color: Colors.blue[400],
            child: Text('Navigation'),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MyHome.myRoute);
            },
            leading: Icon(
              Icons.home,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(MySetting.myRoute);
            },
            leading: Icon(
              Icons.settings,
              size: 35,
              color: Colors.blue[600],
            ),
            title: Text(
              'Settings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
            ),
          ),
        ]),
      ),
      body: const Center(
        child: Text('My Settings'),
      ),
    );
  }
}
