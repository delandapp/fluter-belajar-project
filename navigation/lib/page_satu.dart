import 'package:flutter/material.dart';
import 'package:navigation/page_dua.dart';

class Page_1 extends StatelessWidget {
  const Page_1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1'),centerTitle: true,),
      body: Center(
        child: Text(
          'Ini Page 1!',
          style: TextStyle(fontSize: 50),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ! PushReplacement (Lapisan 1 Dihapus jadi tidak bisa kembali)
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return Page_2();
            }));
          },
          child: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.amber,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
