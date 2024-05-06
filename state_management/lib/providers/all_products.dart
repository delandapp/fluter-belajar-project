import 'dart:math';

import 'package:flutter/material.dart';
import 'package:state_management/models/product.dart';

class Products with ChangeNotifier {
  // Kita buat variabel _allProducts (Private Variabel)
  final List<Product> _allProducts = List.generate(
    25,
    (index) {
      return Product(
        id: "id_${index + 1}",
        title: "Product ${index + 1}",
        description: 'Ini adalah deskripsi produk ${index + 1}',
        price: 10 + Random().nextInt(100).toDouble(),
        imageUrl: 'https://picsum.photos/id/$index/200/300',
      );
    },
  );

  List<Product> get allProducts {
    return [..._allProducts];
  }

  Product findById(String id) {
    return _allProducts.firstWhere((element) => element.id == id);
  }

  void addProduct(values) {
    _allProducts.add(values);
    // Agar ketiga tiap product ditambahkan jadi memberitau semua listerner bisa mendengarkan (ada yang berubah)
    notifyListeners();
  }
}
