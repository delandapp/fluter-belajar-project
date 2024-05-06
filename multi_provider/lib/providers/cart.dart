import 'package:multi_provider/models/cart_item.dart';
import 'package:flutter/foundation.dart';

class Cart with ChangeNotifier {

    final Map<String, CartItem> _items = {};

    Map<String, CartItem> get items => _items;

    double get total {
      double total = 0.0;
      _items.forEach((key, value) { 
        total += value.quantity * value.price;
      });
      return total;
    }

    int get jumlah {
      int jumlah = _items.length;
      _items.forEach((key, value) {
        if (value.quantity > 1) {
          jumlah += value.quantity - 1;
        }
      });
      return jumlah;
    }

    void addCart({
    required String id,
    required String title,
    required double price,
  }) {
    if(_items.containsKey(id)){
      // jika ada item yang sama / jika sudah ada key yang sama
      _items.update(id, (value) => CartItem(
        id: value.id,
        title: value.title,
        price: value.price,
        quantity: value.quantity + 1,
      ));
    }
    else {
      // jika ada item tidak ada / jika key belum ada
      _items.putIfAbsent(id, () => CartItem(
        id: DateTime.now().toString(),
        title: title,
        price: price,
        quantity: 1,
      ));
    }
    notifyListeners();
  }

  void removeSingleItem (String id) {
    if (!_items.containsKey(id)) {
      return;
    }
    if (_items[id]!.quantity > 1) {
      _items.update(id, (value) => CartItem(
        id: value.id,
        title: value.title,
        price: value.price,
        quantity: value.quantity - 1,
      ));
    } else {
      _items.remove(id);
    }
    notifyListeners();
  }
}