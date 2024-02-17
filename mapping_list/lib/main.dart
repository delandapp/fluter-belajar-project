import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listData = [
      {
        "name": "Muhammad Deland",
        "age": 20,
        "hoby": ['coding', 'reading', 'sleeping', 'coding', 'reading', 'sleeping', 'coding', 'reading', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
      {
        "name": "Muhammad Yogha",
        "age": 24,
        "hoby": ['berenang', 'mancing', 'sleeping'],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          scrollDirection: Axis.vertical,
          children: listData.map((data) {
            List dataHoby = data['hoby'];
            return Card(
              margin: EdgeInsets.all(20),
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.amber,),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['name']),
                            SizedBox(height: 10,),
                            Text(data['age'].toString()),
                          ],
                        ),
                      ],
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: dataHoby.map((data) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10),
                    
                            ),
                            child: Text(data),
                          );
                        }).toList(),
                      ),
                    )
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
