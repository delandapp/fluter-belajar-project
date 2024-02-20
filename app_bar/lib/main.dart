import 'package:flutter/material.dart';

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
        appBar: AppBar(
          leading: Container(
            decoration: BoxDecoration(color: Colors.red),
          ),
          // Mengcostom width leading
          leadingWidth: 120,
          titleSpacing: 0,
          title: Text('Belajar App Bar'),
          // agar di tengah
          centerTitle: true,
          actions: [
            Container(
              width: 20,
              decoration: BoxDecoration(color: Colors.red),
            ),
            Container(
              width: 20,
              decoration: BoxDecoration(color: Colors.amber),
            ),
            Container(
              width: 20,
              decoration: BoxDecoration(color: Colors.green),
            ),
          ],
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
