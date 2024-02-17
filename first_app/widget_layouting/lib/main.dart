import 'package:flutter/material.dart';
import 'package:widget_layouting/image.dart';
import 'package:widget_layouting/view-tile.dart';
import 'package:widget_layouting/view-widget.dart';
import 'package:widget_layouting/visible-widget.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(title: Text('Widget Layouting')), body: imageApp()),
    );
  }
}
