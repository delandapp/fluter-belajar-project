import 'package:flutter/material.dart';
import 'package:routing/pages/photo_page.dart';

class galeryPage extends StatelessWidget {
  static const nameRoute = '/galeryPage';
  const galeryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galery Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Text(
              'Page Galery',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Icon(Icons.back_hand)),
              TextButton(
                  onPressed: () {
                    // Navigator.of(context)
                    //     .push(MaterialPageRoute(builder: (context) {
                    //   return photoPage();
                    // }));
                    Navigator.of(context).pushNamed(photoPage.nameRoute);
                  },
                  child: Text('Next'))
            ],
          )
        ],
      ),
    );
  }
}
