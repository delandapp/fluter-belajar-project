import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final List<Container> myList = List.generate(90, (index) => 
    Container(
      color: Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
       ),
      )
    );
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Grid View'),),
        // body: GridView(
        //   padding: EdgeInsets.all(10),
        //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //     crossAxisCount: 3,
        //     crossAxisSpacing: 10,
        //     mainAxisSpacing: 10,
        //     childAspectRatio: 4/3
        //   ),
        //   children: myList,
        // ),
        body: GridView.count(crossAxisCount: 3,children: myList,crossAxisSpacing: 10,mainAxisSpacing: 10,padding: EdgeInsets.all(10),),
      ),
    );
  }
}
