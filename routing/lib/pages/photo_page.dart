import 'package:flutter/material.dart';

class photoPage extends StatelessWidget {
  static const nameRoute = '/photoPage';
  const photoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Poto Page'),
      ),
      body: Center(
        child: Text(
          'Poto Galery',
          style: TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
