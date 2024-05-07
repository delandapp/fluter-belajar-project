import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/player.dart';

class Players with ChangeNotifier {
  // inisiasi agar mengambil data saat pertama kali masuk
  Players() {
    getData();
  }
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

  void getData() {
    Uri url = Uri.parse(
        "https://belajarfirebaseflutter-c8c4d-default-rtdb.asia-southeast1.firebasedatabase.app/player.json");
    http.get(url).then((response) {
      final data = json.decode(response.body) as Map<String, dynamic>;
      _allPlayer = data.entries.map((e) {
        return Player(
          id: e.key,
          name: e.value["name"],
          position: e.value["position"],
          imageUrl: e.value["imageUrl"],
          createdAt: DateTime.parse(e.value["createdAt"]),
        );
      }).toList();
      notifyListeners();
    });
  }

  Future<void> editPlayer(
      String id, String name, String position, String image) {
    Player selectPlayer = _allPlayer.firstWhere((element) => element.id == id);
    Uri url = Uri.parse(
        "https://belajarfirebaseflutter-c8c4d-default-rtdb.asia-southeast1.firebasedatabase.app/player/$id.json");
    return http
        .patch(
      url,
      body: json.encode(
        {
          "name": name,
          "position": position,
          "imageUrl": image,
        },
      ),
    )
        .then(
      (response) {
        selectPlayer.name = name;
        selectPlayer.position = position;
        selectPlayer.imageUrl = image;
        print(_allPlayer);
        notifyListeners();
      },
    );
  }

  Future<void> deletePlayer(String id) {
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
