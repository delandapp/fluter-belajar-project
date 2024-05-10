import 'package:flutter/material.dart';

import '../models/product.dart';

class Products extends ChangeNotifier {
  List<Product> _data = [];

  List<Product> get allProducts => _data;

  void addProduct(String title, DateTime date) {
    var product = Product(
      DateTime.now().toString(),
      title,
      date,
    );

    _data.add(product);
    notifyListeners();
  }

  void deleteProduct(String id) {
    _data.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
