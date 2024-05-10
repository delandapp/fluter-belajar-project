import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedValue;
  List<String> listNegara = ["Indonesia", "Malaysia", "India", "Filipina", "Argentina"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        Center(
          child: DropdownButton(
            onChanged: (value) {
              setState(() {
                selectedValue = value.toString();
              });
            },
            hint: const Text("Pilih Negara Ini"),
            value: selectedValue,
            items: listNegara
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
          ),
        ),
        DropdownSearch<String>(
          popupProps: PopupProps.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('A'),
          ),
          items: listNegara,
          dropdownDecoratorProps: const DropDownDecoratorProps(
            dropdownSearchDecoration: InputDecoration(
              labelText: "Menu mode",
              hintText: "country in menu mode",
            ),
          ),
          onChanged: print,
          selectedItem: "Indonesia",
        ),
        DropdownSearch<String>.multiSelection(
          items: listNegara,
          popupProps: PopupPropsMultiSelection.menu(
            showSelectedItems: true,
            disabledItemFn: (String s) => s.startsWith('A'),
          ),
          onChanged: print,
          selectedItems: const ["Indonesia"],
        )
      ],
    ));
  }
}
