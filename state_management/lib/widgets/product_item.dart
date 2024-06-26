import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/product.dart';

import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Product>(context, listen: false);

    //* Nah gimana kalau kita buat yang listen hanya iconButton kan karena yang di render mengulang hanya iconButtonya
    //* kita bisa membungkus nya dengan widget Consumer (listen nya akan selalu true)
    print("WIDGET REBUILD");

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: Consumer<Product>(
            builder: (context, productData, child) => IconButton(
            icon: (productData.isFavorite) ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border_outlined),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              productData.statusFav();
            },
          ),
          ),
          title: Text(
            productData.title.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon:  const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {},
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productData.id,
            );
          },
          child: Image.network(
            productData.imageUrl.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
