import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {

  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  bool myValue = false;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Switch(value: myValue, onChanged: (value){
                setState(() {
                  myValue = !myValue;
                });
              },activeColor: Colors.amber,activeTrackColor: Colors.green,inactiveTrackColor: Colors.red,inactiveThumbColor: Colors.blueAccent,),
              Text('My Switch Is ${myValue ? 'On' : 'Off'}'),

              Switch.adaptive(value: myValue, onChanged: (value){
                setState(() {
                  myValue = !myValue;
                });
              }),
              Text('My Switch Iphone Is ${myValue ? 'On' : 'Off'}'),
            ],
          ),
        ),
      ),
    );
  }
}
