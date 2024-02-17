import 'package:flutter/material.dart';

class viewWidget extends StatelessWidget {
  viewWidget({super.key});
  final List<Widget> listText = List.generate(100, (index) => Text('Ini angka ke '+ index.toString(), style: TextStyle(fontSize: 10+ double.parse(index.toString())),));
  final List<Color> listColor = [
    Colors.blue,
    Colors.green,
    Colors.purple,
    Colors.pink,
  ];
  final List<Widget> listContainer = [
    Container(
          width: 200,
          height: 200,
          color: Colors.red,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.green,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.yellow,
        ),
        Container(
          width: 200,
          height: 200,
          color: Colors.pink,
        ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: listText,
        // return Container(
        //   height: 200,
        //   color: listColor[index],
        // );  
  
    );
    // return ListView.builder(
    //   itemCount: listColor.length,
    //   itemBuilder: (context, index) {
    //     return Container(
    //       height: 200,
    //       color: listColor[index],
    //     );  
    //   },
    // );
    // return ListView(
    //   children: listContainer,
    // );
  }
}