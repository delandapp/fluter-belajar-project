import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';

class ProductItem extends StatefulWidget {
  // Fungsi key adalah menandai setiap widget agar elementnya bisa dihapus sesuai indentik dengan widget tersebut
  ProductItem(this.prodId, this.title, this.date, Key key) : super(key: key);

  final String prodId, title;
  final DateTime date;

  @override
  State<ProductItem> createState() => _ProductItemState();

}

class _ProductItemState extends State<ProductItem> {
  Color? bgColor;
  @override
  void initState() { 
    super.initState();
    List<Color> randomColor = [
      Colors.pink,
      Colors.purple,
      Colors.brown,
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.black,
      Colors.blue,
    ]; 
    bgColor = randomColor[Random().nextInt(randomColor.length)];
  }

  @override
  Widget build(BuildContext context) {
    var products = Provider.of<Products>(context, listen: false);
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: bgColor,
      ),
      title: Text("${widget.title}"),
      subtitle: Text(DateFormat.yMMMEd().format(widget.date)),
      trailing: IconButton(
        onPressed: () => products.deleteProduct(widget.prodId),
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }
}
