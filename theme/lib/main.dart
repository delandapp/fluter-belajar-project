import 'package:flutter/material.dart';
import 'package:theme/pages/text_pages.dart';
import 'package:theme/pages/themedata_page.dart';
import 'package:theme/theme/text_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          // ! Agar warna thema menjadi dark (gelap) secara default light
          // brightness: Brightness.dark,
          // ! Kepadatan (Istilahnya padding) secara default adaptive
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          // ! Lebih padat
          // visualDensity: VisualDensity.compact
          // visualDensity: VisualDensity.comfortable
          visualDensity: const VisualDensity(horizontal: 4, vertical: 4),
          // ! Agar thema warna bisa berubah sesuai warna kita (Material Colors buka 0xff)
          // primarySwatch: Colors.amber,
          
          primarySwatch: const MaterialColor(
            0xFF673AB7, // Nilai hex warna dasar
            <int, Color>{
              50: Color(0xFFE1BEE7), // Warna 50%
              100: Color(0xFFC7CEEA), // Warna 100%
              200: Color(0xFFA8A4FF), // Warna 200%
              300: Color(0xFF8979FF), // Warna 300%
              400: Color(0xFF673AB7), // Warna 400% (warna dasar)
              500: Color(0xFF460080), // Warna 500%
              600: Color(0xFF3F0071), // Warna 600%
              700: Color(0xFF380062), // Warna 700%
              800: Color(0xFF310053), // Warna 800%
              900: Color(0xFF2A0044), // Warna 900%
            },
          ),
          primaryColor: Colors.amber,
          textTheme: textTheme,
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              color: Colors.blue,
              fontSize: 30.0,
              fontWeight: FontWeight.w900
            )
          )
          // appBarTheme: AppBarTheme(
          //   color: Colors.blueGrey
          // )
          
        ),
      debugShowCheckedModeBanner: false,
      home: const LoremIpsumApp(),
    );
  }
}

