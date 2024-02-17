import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Faker faker = new Faker();
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(appBar: AppBar(title: const Text('Chat App')), body: ListView.builder(
        itemBuilder: (context, index) => ChatStyle(name: faker.person.name(), companyName: faker.company.name(), jobName: faker.job.title(), imageName: faker.image.image()),
        itemCount: 20,
      )),
    );
  }
}

class ChatStyle extends StatelessWidget {
    // Bikin Field
    final String name;
    final String companyName;
    final String jobName;
    final String imageName;
    ChatStyle({required this.name, required this.companyName, required this.jobName, required this.imageName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(imageName, width: 50, height: 50),
      title: Text(name),
      subtitle: Text(jobName),
      trailing: Text(companyName),
    );
  }
}
