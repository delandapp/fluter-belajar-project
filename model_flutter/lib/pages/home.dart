import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:model_flutter/models/Product.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    List<Product> listProduct = List.generate(
        50,
        (index) => Product(
            faker.food.restaurant(),
            10000 + Random().nextInt(100000),
            "https://picsum.photos/id/${index}/400/400",
            faker.lorem.sentence()));
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) {
            return GridTile(
              child: Image.network(
                listProduct[index].imgUrl.toString(),
                width: double.infinity,
              ),
              footer: Container(
                height: 100,
                color: Colors.blue.withOpacity(0.4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      listProduct[index].titleProduct.toString(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w900),
                    ),
                    Text('RP.${listProduct[index].hargaProduct.toString()}',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900)),
                    Text(listProduct[index].descProduct.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w900)),
                  ],
                ),
              ),
            );
          },
          itemCount: listProduct.length,
        ),
      ),
    );
  }
}
