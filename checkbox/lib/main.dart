import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/colors.dart';
import './pages/home_page.dart';
import './pages/add_color_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MultiColor(),
      builder: (context, child) => MaterialApp(
        home: HomePage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          AddColorPage.routeName: (ctx) => AddColorPage(),
        },
      ),
    );
  }
}
