import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/all_products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; // is the id!

    final product = Provider.of<Products>(context).findById(productId);
    // ...
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 250,
            child: Image.network(product.imageUrl.toString(),fit: BoxFit.cover,),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(product.title.toString()),
          Text("Harga ${product.price.toString()}.000",style: const TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
          Text(product.description.toString(),style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
