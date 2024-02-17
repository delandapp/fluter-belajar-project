
import 'package:flutter/material.dart';

// void main() {
//   runApp(MainApp());
// }

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: Text('App Bars'),
        ),
        body: Center(
          child: Text(
            'Hello World!',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              backgroundColor: Colors.black,
              fontSize: 20,
              color: Colors.white,
              decorationStyle: TextDecorationStyle.dashed,
              decoration: TextDecoration.lineThrough,
              decorationThickness: 2
            ),
          ),
        ),
      ),
    );
  }
}
