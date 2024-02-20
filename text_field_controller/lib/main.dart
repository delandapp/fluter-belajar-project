import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController myController = TextEditingController();
  String? hasil;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Statefull Widget',
      home: Scaffold(
        appBar: AppBar(title: Title(color: Colors.green, child: const Text('Statefull Widget'))),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(hasil??''),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: TextField(
                autofocus: true,
                controller: myController,
                onChanged: (value) {
                  // setState(() {
                  //   hasil = value;
                  // });
                },
                onSubmitted: (value) {
                  setState(() {
                    hasil =  value;
                    myController.text = '';
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
