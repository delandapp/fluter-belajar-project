import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              //* Fitur Text Field
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    autocorrect: false,
                    autofocus: false,
                    enableSuggestions: true,
                    // ! Ketika kita mau copy paste
                    enableInteractiveSelection: true,
                    // ! enable dan disable
                    enabled: true,
                    // ! mengubah kayak password
                    obscureText: false,
                    //! mengubah bulat bulat
                    obscuringCharacter: '=',
                    //! mengubah keyboard HP
                    keyboardType: TextInputType.number,
                    //! mengubah tidak bisa di input
                    readOnly: true,
                  )),
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    autofocus: true,
                    showCursor: true,
                    cursorColor: Colors.red,
                    cursorHeight: 25,
                    cursorWidth: 10,
                    cursorRadius: Radius.circular(20),
                    textAlign: TextAlign.start,
                    textAlignVertical: TextAlignVertical.center,
                    textCapitalization: TextCapitalization.characters,
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    ),
                    decoration: InputDecoration(
                      icon: Icon(Icons.person, size: 35),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red
                        )
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.green
                        )
                      ),
                      prefixIcon: Icon(Icons.person_2_sharp),
                      suffixIcon: IconButton(onPressed: null, icon: Icon(Icons.remove_red_eye)),
                      prefixText: 'Username',
                      hintText: 'Please input your Name',
                      hintStyle: TextStyle(
                        color: Colors.red
                      ),
                      label: Text('full name'),
                      labelStyle: TextStyle(
                        color: Colors.red
                      )
                    ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
