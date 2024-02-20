import 'package:flutter/material.dart';
import 'package:navigation/page_satu.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Page_1(),
    );
  }
}
