import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/colors.dart';

class AddColorPage extends StatelessWidget {
  static const routeName = "/add";

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var colorsClass = Provider.of<MultiColor>(context, listen: false);
    void saveData() {
      colorsClass.addColor(titleController.text);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Color Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
          child: Column(
            children: [
              TextField(
                autocorrect: false,
                autofocus: true,
                controller: titleController,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  labelText: "Input Color",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                onEditingComplete: saveData,
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: saveData,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
