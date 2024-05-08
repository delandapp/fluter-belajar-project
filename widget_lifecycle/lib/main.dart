import 'package:flutter/material.dart';
import 'package:widget_lifecycle/pages/counter_page.dart';
import 'package:widget_lifecycle/pages/other_page.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ConterPage(),
      initialRoute: '/counter-page',
      routes: {
        ConterPage.nameRoute : (context) => ConterPage(),
        OtherPage.nameRoute : (context) => const OtherPage(),
      },
    );
  }
}


