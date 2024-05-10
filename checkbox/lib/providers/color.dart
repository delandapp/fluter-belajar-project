import 'package:flutter/material.dart';

class SingleColor with ChangeNotifier {
  String id, title;
  bool status;

  SingleColor({
    required this.id,
    required this.title,
    this.status = false,
  });

  void toogleStatus() {
    this.status = !this.status;
    notifyListeners();
  }
}
