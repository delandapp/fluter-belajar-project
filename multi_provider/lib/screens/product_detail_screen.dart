import 'package:flutter/material.dart';
import 'package:multi_provider/providers/cart.dart';
import 'package:multi_provider/screens/cart_screen.dart';
import 'package:multi_provider/widgets/badge.dart';
import 'package:provider/provider.dart';

import '../providers/all_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!
    final product = Provider.of<Products>(context).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Product Details'),
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
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 30),
          Text(
            product.title,
            style: const TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "\$${product.price}",
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            product.description,
            style: const TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 15),
          Consumer<Cart>(
              builder: (context, value, child) => TextButton(
                    onPressed: () {
                      value.addCart(
                        id: product.id,
                        title: product.title,
                        price: product.price,
                      );
                    },
                    child: const Text("Add To Cart"),
                  ))
        ],
      ),
    );
  }
}
