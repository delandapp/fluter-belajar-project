import 'package:flutter/material.dart';
import 'package:widget_lifecycle/pages/counter_page.dart';

class OtherPage extends StatelessWidget {
  static const nameRoute = '/other-page';
  const OtherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Other Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const Center(
            child: Text("Other Page"),
          ),
          TextButton(onPressed: () => Navigator.pushReplacementNamed(context,ConterPage.nameRoute,arguments: ModalRoute.of(context)!.settings.arguments as int), child: const Text("Go To Back Page"))
        ],
      ),
    );
  }
}