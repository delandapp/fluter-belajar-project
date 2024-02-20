import 'package:flutter/material.dart';
class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  String? data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dialog')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context, 
            builder: (context) {
              return AlertDialog(
                title: Text('Confirm'),
                content: Text('Are your sure to delete this item ?'),
                actions: [
                  FloatingActionButton(onPressed: () {
                    setState(() {
                      data = "Data Berhasil Dihapus";
                    });
                    // Tutup dialog
                    Navigator.of(context).pop(true);
                  },child: Text('Yes'),),
                  FloatingActionButton(onPressed: (){
                    setState(() {
                      data = "Data Gagal Dihapus";
                    });
                    Navigator.of(context).pop(false);
                  },child: Text('No'),),
                ],
              );
            } 
          ).then((value) => print(value));
        },
        child: Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Center(
        child: Text(data??''),
      ),
    );
  }
}
