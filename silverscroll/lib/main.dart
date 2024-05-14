import 'package:flutter/material.dart';
import 'package:silverscroll/pages/learning_page.dart';
import 'package:silverscroll/pages/pixel_page.dart';

void main() {
  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Pixel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const LearningPathPage(),
    );
  }
}