import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpProvider with ChangeNotifier {
  Map<String,dynamic> _data = {};
  Map<String,dynamic> get data => _data;
  int get jumlahData => _data.length;

void connectAPI(String name, String jobs) async {
    Uri url = Uri.parse("https://reqres.in/api/users");

    // kita kasih await agar pas json.decode bisa menggunakan .body
    var hasilResponse = await http.post(
      url,
      body: {"name": name, "job": jobs},
    );


    // Memasukan data response ke class HttpStatefull
    _data = json.decode(hasilResponse.body); 
    notifyListeners();
    // print(_data['createdAt']);
  }
}