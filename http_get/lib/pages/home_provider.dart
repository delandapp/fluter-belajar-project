import 'package:flutter/material.dart';
import 'package:http_get/models/http_provider.dart';
import 'package:provider/provider.dart';

class HomeProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     HttpProvider dataProvider = Provider.of(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("GET - STATEFUL"),
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Container(
                height: 100,
                width: 100,
                child: Consumer<HttpProvider>(
                builder: (context, value, child) => Image.network(
                  value.data['avatar'] == null ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlU8V9gP8YGrPOMrRQgjXH03iqu2j1OTzSqw&usqp=CAU" : value.data['avatar'],
                  fit: BoxFit.cover,
                ),
              ),
              ),
            ),
            SizedBox(height: 20),
             FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  "ID : ${value.data['id'] == null ? "Belum ada data" : value.data['id']}",
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  value.data['first_namex'] == null ? "Belum ada data" : value.data['first_name'] + " " + value.data['last_name'],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Consumer<HttpProvider>(
                builder: (context, value, child) => Text(
                  value.data['email'] == null ? "Belum ada data" : value.data['email'],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
                dataProvider.connectAPI("2");
              },
              child: Text(
                "GET DATA",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
