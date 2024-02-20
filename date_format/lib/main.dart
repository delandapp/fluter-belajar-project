import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            DateFormat.d().format(DateTime.now()) + ' ' + DateFormat.EEEE().format(DateTime.now()) + ' ' + DateFormat.yMMMMEEEEd().add_jm().format(DateTime.now())
          ),
        ),
      ),
    );
  }
}
