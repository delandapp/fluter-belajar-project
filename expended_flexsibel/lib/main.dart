import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeApp());
  }
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expended And Flexsibel"),
      ),
      body: Column(
        children: [
          Expanded(
            // flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  // fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    // height: 200,
                  ),
                ),
                Flexible(
                  fit: FlexFit.tight,
                  //! Ketika menggunakan flex,tidak boleh ada child di dalam child
                  // flex: 1,
                  child: Container(
                    height: double.infinity,
                    color: Colors.blue,
                    // height: 200,
                    child: Text("Muhammad Deland"),
                  ),
                ),
                Flexible(
                  // fit: FlexFit.tight,
                  flex: 1,
                  child: Container(
                    color: Colors.purple,
                    // height: 200,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 3,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 100,
                        color: Color.fromARGB(255, Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255)),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(
                        height: 100,
                        color: Color.fromARGB(255, Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255)),
                      ),
                    ),
                    Flexible(
                      fit: FlexFit.tight,
                      child: Container(
                        height: 100,
                        color: Color.fromARGB(255, Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255)),
                      ),
                    ),
                  ],
                );
              },
              itemCount: 100,
            ),
          )
        ],
      ),
    );
  }
}
