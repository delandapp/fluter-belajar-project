import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Future<Map<String, dynamic>> ambilData() async {
    var hasilGet = await http.get(Uri.parse("https://reqres.in/api/users/2"));

    var data = json.decode(hasilGet.body)["data"];

    return data;
  }

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future builder'),
      ),
      body: FutureBuilder(
        future: ambilData(),
        builder: (context, snapshot) {
          print(snapshot.data!['first_name']);
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(),);
          } else {
            return Column( 
            children: [
              //* ... Nama
              Text(snapshot.data!['first_name'].toString(),style: const TextStyle(fontSize: 35),),
            ],
          );
          }    
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ambilData,
        child: const Icon(Icons.search),
      ),
    );
  }
}
