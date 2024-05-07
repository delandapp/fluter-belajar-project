import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/player.dart';

class Players with ChangeNotifier {
  List<Player> _allPlayer = [];

  List<Player> get allPlayer => _allPlayer;

  int get jumlahPlayer => _allPlayer.length;

  Player selectById(String id) =>
      _allPlayer.firstWhere((element) => element.id == id);

  // Kenapa harus future? agar bisa menggunakan then dibagian add_player Navigator.pop(context)
  Future<void> addPlayer(String name, String position, String image) {
    DateTime datetimeNow = DateTime.now();
    // jika kita ingin menentukan struktur harus dibagian akhir url misal player/data.json atau player/data/detail.json
    Uri url = Uri.parse(
        "https://belajarfirebaseflutter-c8c4d-default-rtdb.asia-southeast1.firebasedatabase.app/player.json");
    return http
        .post(
      url,
      body: json.encode(
        {
          // "id": datetimeNow.toString(), (Gaperlu karena firebase otomatis memberi string acak)
          "name": name,
          "position": position,
          "imageUrl": image,
          "createdAt": datetimeNow.toString(),
        },
      ),
    )
        .then(
      (response) {
        print(json
            .decode(response.body)["name"]); // untuk mendapatkan string acak
        _allPlayer.add(
          Player(
            id: json.decode(response.body)["name"].toString(),
            name: name,
            position: position,
            imageUrl: image,
            createdAt: datetimeNow,
          ),
        );

        notifyListeners();
      },
    );
  }

  void editPlayer(String id, String name, String position, String image,
      BuildContext context) {
    Player selectPlayer = _allPlayer.firstWhere((element) => element.id == id);
    selectPlayer.name = name;
    selectPlayer.position = position;
    selectPlayer.imageUrl = image;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Berhasil diubah"),
        duration: Duration(seconds: 2),
      ),
    );
    notifyListeners();
  }

  Future <void> deletePlayer(String id) {
    Uri url = Uri.parse(
        "https://belajarfirebaseflutter-c8c4d-default-rtdb.asia-southeast1.firebasedatabase.app/player/$id.json");
    return http
        .delete(
      url,
    )
        .then(
      (response) {

        _allPlayer.removeWhere((element) => element.id == id);
        print(_allPlayer);
        notifyListeners();
      },
    );
    
  }
}
