import 'package:flutter/material.dart';

void main() {
  runApp(invisibel());
}

class invisibel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('DELAND')
          ),
        body: Text('test'),
      ),
    );
  }
}