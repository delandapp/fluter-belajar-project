import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            color: Colors.deepOrange,
            width: double.infinity,
            height: double.infinity,
            child: FittedBox(
              child: Text("Muhammad Deland Arjuna Putra"),
            )
          ),
        ),
      ),
    );
  }
}
