import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/providers/all_products.dart';

import './screens/products_overview_screen.dart';
import './screens/product_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = ThemeData();
    return ChangeNotifierProvider(
      create: (context) => Products(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: themeData.colorScheme.copyWith(secondary: Colors.amber),
          fontFamily: 'Lato',
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        },
      ),
    );
  }
}

class ScreenSementara extends StatelessWidget {
  ScreenSementara({super.key});
  final List<Text> myList = List.generate(100, (i) => Text('Item ${i+1}', style: const TextStyle(fontSize: 35),));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
      children: [Container(width: 100,height: 100,color: Colors.green,),...myList,Container(width: 100,height: 100,color: Colors.amber,)],
    ),
    );
  }
}
