import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/all_products.dart';
import 'package:state_management/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  // const ProductGrid({
  //   super.key,
  //   required this.loadedProducts,
  // });

  // final List<Product> loadedProducts;

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);
    final allProduct = productData.allProducts;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: allProduct.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: allProduct[i],
        child: ProductItem(),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
