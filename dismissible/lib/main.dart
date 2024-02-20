import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHome(),
    );
  }
}

class MyHome extends StatelessWidget {
  final Faker faker = Faker();
  MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dismissible'),),
      body: ListView.builder(padding: EdgeInsets.all(10), itemCount: 20, itemBuilder: (context, index) {
        return Dismissible(
          onDismissed: (direction) {
            print("Dissmis");
          },
          confirmDismiss: (direction) {
            return showDialog(context: context, builder: (context) {
              return AlertDialog(
                title: Text('Confirm'),
                content: Text('Are you sure to delete ?'),
                actions: [
                  ElevatedButton(onPressed: (){Navigator.of(context).pop(true);}, child: Text('Yes')),
                  ElevatedButton(onPressed: (){Navigator.of(context).pop(false);}, child: Text('No')),
                ],
              );
            });
          },
          key: Key(index.toString()),
          // Mengatur geser dari kanan ke kiri saja
          direction: DismissDirection.endToStart,
          // Menambahkan background
          background: Container(
            color: Colors.red,
            child: Icon(Icons.delete, color: Colors.amber,size: 25,),
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 10),
          ),
          child: ListTile(
            leading: CircleAvatar(
              child: Center(
                child: Text('${index + 1}'),
              ),
            ),
            title: Text('Mr ${faker.person.name()}'),
            subtitle: Text('Jobs ${faker.job.title()}'),
          ),
        );
      }),
    );
  }
}
