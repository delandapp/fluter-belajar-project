import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../models/product.dart';

class Products with ChangeNotifier {
  final String urlMaster = "https://authfirebase-277f5-default-rtdb.asia-southeast1.firebasedatabase.app/";

  String? token;

  List<Product> _allProduct = [];

  List<Product> get allProduct => _allProduct;

  void updateData(tokenData) {
    token = tokenData;
    notifyListeners();
  }

  Future<void> addProduct(String title, String price) async {
    // Tambahkan ?auth=$token untuk membuat autentikasi dengan firebase
    Uri url = Uri.parse(
        "${urlMaster}products.json?auth=$token");
    DateTime dateNow = DateTime.now();
    try {
      var response = await http.post(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "createdAt": dateNow.toString(),
          "updatedAt": dateNow.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product data = Product(
          id: json.decode(response.body)["name"].toString(),
          title: title,
          price: price,
          createdAt: dateNow,
          updatedAt: dateNow,
        );

        _allProduct.add(data);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void editProduct(String id, String title, String price) async {
    Uri url = Uri.parse(
        "${urlMaster}products/$id.json?auth=$token");
    DateTime date = DateTime.now();
    try {
      var response = await http.patch(
        url,
        body: json.encode({
          "title": title,
          "price": price,
          "updatedAt": date.toString(),
        }),
      );

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        Product edit = _allProduct.firstWhere((element) => element.id == id);
        edit.title = title;
        edit.price = price;
        edit.updatedAt = date;
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  void deleteProduct(String id) async {
    Uri url = Uri.parse(
        "${urlMaster}products/$id.json?auth=$token");

    try {
      var response = await http.delete(url);

      if (response.statusCode > 300 || response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        _allProduct.removeWhere((element) => element.id == id);
        notifyListeners();
      }
    } catch (err) {
      throw (err);
    }
  }

  Product selectById(String id) {
    return _allProduct.firstWhere((element) => element.id == id);
  }

  Future<void> inisialData() async {
    Uri url = Uri.parse(
        "${urlMaster}products.json");

    try {
      var response = await http.get(url);

      if (response.statusCode >= 300 && response.statusCode < 200) {
        throw (response.statusCode);
      } else {
        var data = json.decode(response.body) as Map<String, dynamic>;
        if (data != null) {
          data.forEach(
            (key, value) {
              Product prod = Product(
                id: key,
                title: value["title"],
                price: value["price"],
                createdAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["createdAt"]),
                updatedAt:
                    DateFormat("yyyy-mm-dd hh:mm:ss").parse(value["updatedAt"]),
              );
              _allProduct.add(prod);
            },
          );
        }
      }
    } catch (err) {
      throw (err);
    }
  }
}
