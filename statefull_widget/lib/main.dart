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
  int conter = 1;
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
            Text(conter.toString(), style: TextStyle(fontSize: 50 + double.parse(conter.toString()))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  //? Memberi kondisi ketika tombol add ditekan dan merender ulang layar
                  if(conter != 1) {
                    setState(() {
                      conter = conter - 1;
                    });
                  }
                }, child: const Icon(Icons.remove)),
                const SizedBox(width: 60),
                ElevatedButton(onPressed: () {
                  //? Memberi kondisi ketika tombol add ditekan dan merender ulang layar
                    setState(() {
                      conter = conter + 1;
                    });
                }, child: const Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
