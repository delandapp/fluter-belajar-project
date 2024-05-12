import 'package:auth_firebase/pages/auth_page.dart';
import 'package:auth_firebase/pages/home_page.dart';
import 'package:auth_firebase/providers/auth.dart';
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
    return MultiProvider(
      providers: [
        // Melempar data provider
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products(),
          update: (context, auth, products) => products!..updateData(auth.idToken),
        ),
        ChangeNotifierProvider(create: (ctx) => Auth()),
      ],
      builder: (context, child) => Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: auth.idToken != null ? HomePage() : LoginPage(),
          routes: {
            AddProductPage.route: (ctx) => AddProductPage(),
            EditProductPage.route: (ctx) => EditProductPage(),
          },
        ),
      ),
    );
  }
}
