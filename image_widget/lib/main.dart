import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Belajar Image Widget'),
        ),
        body: Center(
          child: Container(
          width: 200,
          height: 200,
          color: Colors.blue, //* Warna Background
          child: Image(
            // image: AssetImage('images/logoIcon.jpg'), Menggunakan assets Images
            image: NetworkImage('https://picsum.photos/id/1/200/300'),
          ),
          ),
        ),
      ),
    );
  }
}
