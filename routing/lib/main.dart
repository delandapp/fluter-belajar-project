import 'package:flutter/material.dart';
import 'package:routing/pages/galery_page.dart';
import 'package:routing/pages/home_page.dart';
import 'package:routing/pages/photo_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: homePage(),
      initialRoute: '/homePage',
      routes: {
        homePage.nameRoute:(context) => homePage(),
        galeryPage.nameRoute:(context) => galeryPage(),
        photoPage.nameRoute:(context) => photoPage(),
      },
    );
  }
}
