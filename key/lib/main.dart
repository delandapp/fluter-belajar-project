import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';
import './pages/home_page.dart';
import './pages/add_product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Products>(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          HomePage.routeName: (ctx) => HomePage(),
          AddProductPage.routeName: (ctx) => AddProductPage(),
        },
      ),
    );
  }
}
