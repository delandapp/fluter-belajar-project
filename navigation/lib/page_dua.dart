import 'package:flutter/material.dart';

class Page_2 extends StatelessWidget {
  const Page_2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 2'),centerTitle: true,),
      body: Center(
        child: Text(
          'Ini Page 2!',
          style: TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Icon(
            Icons.keyboard_arrow_left,
            color: Colors.amber,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
