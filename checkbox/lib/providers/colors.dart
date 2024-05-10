import 'dart:convert';

import 'package:flutter/material.dart';

import './color.dart';

import 'package:http/http.dart' as http;

class MultiColor with ChangeNotifier {
  MultiColor(){
    getData();
  }

  List<SingleColor> _colors = [];

  List<SingleColor> get colors => _colors;

  void selectAll(bool nilai) {
    if (nilai) {
      _colors.forEach((element) {
        element.status = true;
      });
    } else {
      _colors.forEach((element) {
        element.status = false;
      });
    }
    notifyListeners();
  }

  checkAllStatus() {
    var hasil = _colors.every((element) => element.status == true);
    return hasil;
  }

  void addColor(String title) async {
    Uri url = Uri.parse(
        "https://belajarcheckbook-default-rtdb.asia-southeast1.firebasedatabase.app/colors.json");
    //! Menggunakan (Error Handling)
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            "title": title,
            "status": false,
          },
        ),
      );
      if (response.statusCode.toInt() >= 200 &&
          response.statusCode.toInt() < 300) {
        print(json
            .decode(response.body)["name"]); // untuk mendapatkan string acak
        _colors.add(
          SingleColor(
            id: json.decode(response.body)["name"],
            title: title,
          ),
        );

        notifyListeners();
      } else {
        // Ini akan melempar ke catch error di bawah
        throw (response.statusCode.toString());
      }
    } catch (e) {
      throw (e);
    }
    notifyListeners();
  }

  getData() {
    Uri url = Uri.parse(
        "https://belajarcheckbook-default-rtdb.asia-southeast1.firebasedatabase.app/colors.json");
    http.get(url).then((response) {
      //! Menggunakan (Error Handling)
      if (response.statusCode != 200) {
        throw Exception('Failed to load data');
      }
      final data = json.decode(response.body) as Map<String, dynamic>;

      //! kita bisa menggunakan entres.map dan juga forEach
      // _allPlayer = data.entries.map((e) {
      //   return Player(
      //     id: e.key,
      //     name: e.value["name"],
      //     position: e.value["position"],
      //     imageUrl: e.value["imageUrl"],
      //     createdAt: DateTime.parse(e.value["createdAt"]),
      //   );
      // }).toList();
      //! kita bisa menggunakan forEach
      data.forEach(
        (key, value) {
          _colors.add(
            SingleColor(
              id: key,
              title: value["title"],
            ),
          );
        },
      );

      notifyListeners();
    });
  }

  Future<void> deleteColor(String id) {
    Uri url = Uri.parse(
        "https://belajarcheckbook-default-rtdb.asia-southeast1.firebasedatabase.app/colors/$id.json");
    return http
        .delete(
      url,
    )
        .then(
      (response) {
        _colors.removeWhere((element) => element.id == id);
        notifyListeners();
      },
    );
  }
}
