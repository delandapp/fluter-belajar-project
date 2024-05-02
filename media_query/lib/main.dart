import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  // ! Untuk medisable agar tidak bisa di rotate
  // const List<DeviceOrientation> deviceOrientations = [
  //   DeviceOrientation.portraitDown,
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.landscapeLeft,
  //   DeviceOrientation.landscapeRight
  // ];
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(deviceOrientations);
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //* Mengambil tinggi layar hp
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    //* Mengambil lebar layar hp
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    //* Mengambil tinggi appbar
    final myAppBar = AppBar(
      title: Text("Media Query"),
    );
    //* Mengambil tinggi body hp
    final MediaQueryHeightBody = MediaQueryHeight -
        myAppBar.preferredSize.height -
        MediaQuery.of(context).padding.top;
    //* Mengambil status rotate
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
   
    return MaterialApp(
      theme: ThemeData(
        scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(Colors.green)
        )
      ),
      home: Scaffold(
          appBar: myAppBar,
          body: (isLandscape) == true
              ? Container(
                  height: MediaQueryHeightBody,
                  width: MediaQueryWidth,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQueryHeightBody * 0.7,
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: Text("My Galery Foto ${isLandscape}"),
                      ),
                      Container(
                        height: MediaQueryHeightBody * 0.3,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2
                          ),
                          itemBuilder: (context, index) {
                            return GridTile(
                              child: Container(
                                color: Color.fromARGB(255, Random().nextInt(255), Random().nextInt(255), Random().nextInt(255)),
                              ),
                            );
                          },
                          itemCount: 100,
                          scrollDirection: Axis.vertical,
                        ),
                      )
                    ],
                  ),
                )
                : Container(
                  height: MediaQueryHeightBody,
                  width: MediaQueryWidth,
                  child: Column(
                    children: [
                      Container(
                        height: MediaQueryHeightBody * 0.4,
                        alignment: Alignment.center,
                        color: Colors.green,
                        child: Text("My Galery Foto ${isLandscape}"),
                      ),
                      Container(
                        height: MediaQueryHeightBody * 0.6,
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading:
                                  CircleAvatar(backgroundColor: Colors.amber),
                              title: Text("My Galery Foto ${index + 1}"),
                            );
                          },
                          itemCount: 100,
                          scrollDirection: Axis.vertical,
                          
                        ),
                      )
                    ],
                  ),
                )
                )
    );
  }
}

