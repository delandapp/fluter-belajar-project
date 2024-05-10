import 'package:auth_firebase/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/products.dart';

// import './pages/home_page.dart';
import './pages/add_product_page.dart';
import './pages/edit_product_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => Products(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        routes: {
          AddProductPage.route: (ctx) => AddProductPage(),
          EditProductPage.route: (ctx) => EditProductPage(),
        },
      ),
    );
  }
}