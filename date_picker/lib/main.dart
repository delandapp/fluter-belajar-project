import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Agar di tengah secara vertical
          children: [
            Text(
              selectDate.toString(),
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
                onPressed: () async {
                  final selectedDate = await showDatePicker(
                    context: context,
                    initialDate: selectDate,
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2025),
                    initialEntryMode: DatePickerEntryMode
                        .calendarOnly, //* untuk mengubah mode tampilan
                    initialDatePickerMode: DatePickerMode
                        .day, //* untuk pertama kali pilihan (contoh day)
                    selectableDayPredicate: (day) {
                      if (day.isAfter(
                            DateTime.now().subtract(
                              const Duration(days: 5),
                            ),
                          ) &&
                          day.isBefore(
                            DateTime.now().add(
                              const Duration(days: 2),
                            ),
                          )) {
                            return true;
                          }

                          return false;
                    }, //* kita akan mengenable day yang bisa di pilih hanya 5 hari sebelum hari ini dan 2 hari setelah hari ini
                    helpText: "Help Text",
                    cancelText: "Cancel Text",
                    confirmText: "Confirm Text",
                    fieldHintText: "Masukan tanggal lahir anda", // ini akan muncul jika calender bertype input
                    fieldLabelText: "Field Label Text", // ini akan muncul jika calender bertype input
                    builder: (context, anak) {
                      return Theme(data: ThemeData.dark(), child: anak!);
                    },
                  );
                  if (selectedDate != null) {
                    setState(() {
                      selectDate = selectedDate;
                      print(selectDate);
                    });
                    // Optionally, use the selectedDate for further actions
                  }
                },
                child: const Text("Date Picker")),
          ],
        ),
      ),
    );
  }
}
