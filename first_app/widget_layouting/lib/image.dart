import 'package:flutter/material.dart';


class imageApp extends StatelessWidget {
  imageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.amber,
      child: Image.asset('images/foto.png', fit: BoxFit.cover,),
    );
  }
}