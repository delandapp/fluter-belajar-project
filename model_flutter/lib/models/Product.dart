import 'package:flutter/material.dart';

class Product {
  @required String? titleProduct;
  @required int? hargaProduct;
  @required String? imgUrl;
  @required String? descProduct;
  
  Product(this.titleProduct, this.hargaProduct, this.imgUrl, this.descProduct);
}