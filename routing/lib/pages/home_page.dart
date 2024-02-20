import 'package:flutter/material.dart';
import 'package:routing/pages/galery_page.dart';

class homePage extends StatelessWidget {
  static const nameRoute = '/homePage';
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Home Page',
          style: TextStyle(fontSize: 30),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //   return galeryPage();
          // }));
          Navigator.of(context).pushNamed(galeryPage.nameRoute);
        },
        child: Icon(Icons.arrow_right_outlined),
      ),
    );
  }
}
