// import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  MyHome({super.key});
  final myAppBar = AppBar(title: Text("Android"));

  @override
  Widget build(BuildContext context) {
    return kIsWeb == true
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              // Try removing opacity to observe the lack of a blur effect and of sliding content.
              backgroundColor: CupertinoColors.systemGrey.withOpacity(0.5),
              middle: const Text('CupertinoNavigationBar Sample'),
              leading: CupertinoButton(
                child: Icon(Icons.back_hand, size: 12),
                onPressed: () {
                  // Navigator.of(context).pop();
                },
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 200),
              child: Center(
                  child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // defaultTargetPlatform == TargetPlatform.fuchsia ?
            
                      showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text("Apakah kamu pedofil?"),
                            content: Text(
                                "Jika kamu seorang pedofil maka kamu atheis"),
                            actions: [
                              CupertinoDialogAction(
                                  child: Text("Ya"),
                                  onPressed: () {
                                    Navigator.of(context).pop(true);
                                  }),
                              CupertinoDialogAction(
                                  child: Text("Tidak"),
                                  onPressed: () {
                                    Navigator.of(context).pop(false);
                                  }),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Tombol"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // defaultTargetPlatform == TargetPlatform.fuchsia ?
            
                     showCupertinoModalPopup(context: context, builder: (context) {
                       return Container(
                        height: MediaQuery.of(context).size.height / 3,
                        color: Colors.white,
                         child: CupertinoDatePicker(
                           onDateTimeChanged: (value) {
                             print(value);
                           },
                           initialDateTime: DateTime.now(),
                           mode: CupertinoDatePickerMode.date,
                           minimumYear: 1999,
                           maximumYear: DateTime.now().year,
                         ),
                       );
                     },);
                    },
                    child: Text("Date Picker"),
                  ),
                ],
              )),
            ),
          )
        : Scaffold(
            appBar: myAppBar,
            body: Center(
                child: ElevatedButton(
              onPressed: () {
                // defaultTargetPlatform == TargetPlatform.fuchsia ?

                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Apakah kamu pedofil?"),
                      content:
                          Text("Jika kamu seorang pedofil maka kamu atheis"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            },
                            child: Text("Ya")),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: Text("Tidak")),
                      ],
                    );
                  },
                );
              },
              child: Text("Tombol"),
            )),
          );
  }
}
