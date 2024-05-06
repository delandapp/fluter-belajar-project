import 'package:flutter/material.dart';
import 'package:multi_provider/providers/cart.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, productData, child) => IconButton(
              icon: (productData.isFavorite)
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_border_outlined),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                productData.statusFav();
              },
            ),
          ),
          title: Text(
            productData.title,
            textAlign: TextAlign.center,
          ),
          trailing: Consumer<Cart>(builder: (context, cart, child) => IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              cart.addCart(id: productData.id, title: productData.title, price: productData.price);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text(
                    'Item Berhasil Add Ke Cart!',
                  ),
                  duration: const Duration(seconds: 3),
                  action: SnackBarAction(
                    label: 'Batal',
                    onPressed: () {
                      cart.removeSingleItem(productData.id);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).colorScheme.secondary,
          ),)
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
