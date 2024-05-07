import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
class HttpProvider with ChangeNotifier {
  Map<String,dynamic> _data = {};
  Map<String,dynamic> get data => _data;
  int get jumlahData => _data.length;

  void connectAPI(String id) async {
    Uri uri = Uri.parse("https://reqres.in/api/users/${id}");

    var hasilResponse = await http.get(uri);

    var data = (json.decode(hasilResponse.body))["data"];

    _data = data;
    notifyListeners();
  }
}
