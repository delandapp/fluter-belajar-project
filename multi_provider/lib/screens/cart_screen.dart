import 'package:flutter/material.dart';
import 'package:multi_provider/providers/cart.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Column(
        children: [
          Card(
              child: Container(
            padding: const EdgeInsets.all(20),
            child: Consumer<Cart>(
              builder: (context, value, child) =>
                  Text("Total Pembayaran : ${value.total.toString()}"),
            ),
          )),
          Expanded(
            child: Consumer<Cart>(
              builder: (context, value, child) => ListView.builder(
                  itemCount: value.items.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                          value.items.values.toList()[index].title.toString()),
                      subtitle: Text(value.items.values
                          .toList()[index]
                          .quantity
                          .toString()),
                      trailing: Text(
                          "\$ ${(value.items.values.toList()[index].quantity.toInt() * value.items.values.toList()[index].price.toInt().toInt()).toString()}"),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
