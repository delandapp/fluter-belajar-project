import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final widthBody = MediaQuery.of(context).size.width;
    final heightApp = MediaQuery.of(context).size.height;
    final heightPaddingTop = MediaQuery.of(context).padding.top;
    final myAppBar = AppBar(
      title: Text("Layout Builder"),
    );
    final heightBody =
        heightApp - myAppBar.preferredSize.height - heightPaddingTop;
    return MaterialApp(
      home: Scaffold(
          body: Container(
        width: widthBody,
        height: heightBody * 0.7,
        color: Colors.purple,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MyContainer(widthBody: widthBody,),
              MyContainer(widthBody: widthBody,),
              MyContainer(widthBody: widthBody,),
              MyContainer(widthBody: widthBody,),
            ]),
      )),
    );
  }
}

class MyContainer extends StatelessWidget {
    final double? widthBody;
    MyContainer({required this.widthBody});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          color: Colors.red,
          width: widthBody ! * 0.2,
          height: constraints.maxHeight * 0.5,
        );
      },
    );
  }
}
