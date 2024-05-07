import 'package:flutter/material.dart';
import 'package:http_get/models/http_stateful.dart';

class HomeStateful extends StatefulWidget {
  @override
  _HomeStatefulState createState() => _HomeStatefulState();
}

class _HomeStatefulState extends State<HomeStateful> {
      HttpStateful dataResponse = HttpStateful();
  @override
  Widget build(BuildContext context) {
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
              child: SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  dataResponse.avatar == "" ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRlU8V9gP8YGrPOMrRQgjXH03iqu2j1OTzSqw&usqp=CAU" : dataResponse.avatar,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            FittedBox(
              child: Text(
                "ID : ${dataResponse.id == "" ? "-" : dataResponse.id}",
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(child: Text("Name : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                dataResponse.fullname == "" ? "-" : dataResponse.fullname,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const FittedBox(child: Text("Email : ", style: TextStyle(fontSize: 20))),
            FittedBox(
              child: Text(
                dataResponse.email == "" ? "-" : dataResponse.email,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 100),
            OutlinedButton(
              onPressed: () {
               HttpStateful.connectAPI("10").then((value) {
                  setState(() {
                    dataResponse = value;
                    print(dataResponse.id);
                  });
                });
              },
              child: const Text(
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
