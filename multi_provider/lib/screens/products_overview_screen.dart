import 'package:flutter/material.dart';
import 'package:multi_provider/providers/cart.dart';
import 'package:multi_provider/screens/cart_screen.dart';
import 'package:multi_provider/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../widgets/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('MyShop'),
            const Spacer(),
            Consumer<Cart>(
              builder: (context, value, child) => BadgeCart(
                color: Colors.amber,
                value: Provider.of<Cart>(context).jumlah.toString(),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      CartScreen.routeName,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
      body: ProductGrid(),
    );
  }
}
