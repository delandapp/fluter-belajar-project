import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/players.dart';

class DetailPlayer extends StatelessWidget {
  static const routeName = "/detail-player";

  @override
  Widget build(BuildContext context) {
    final players = Provider.of<Players>(context, listen: false);
    final playerId = ModalRoute.of(context)!.settings.arguments as String;
    final selectPLayer = players.selectById(playerId);
    final TextEditingController imageController =
        TextEditingController(text: selectPLayer.imageUrl);
    final TextEditingController nameController =
        TextEditingController(text: selectPLayer.name);
    final TextEditingController positionController =
        TextEditingController(text: selectPLayer.position);
    final void Function() editPlayer = () {
      players
          .editPlayer(
            playerId,
            nameController.text,
            positionController.text,
            imageController.text,
          )
          .then((_) {Navigator.pop(context); print("Ini Then");})
          .catchError(
            (error) async { await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Error"),
                content: Text(error.toString()),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("OK"))
                ],
              ),
            );print("Ini Catch");}
          );
      ;
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text("DETAIL PLAYER"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(imageController.text),
                    ),
                  ),
                ),
              ),
              TextFormField(
                autocorrect: false,
                autofocus: true,
                decoration: const InputDecoration(labelText: "Nama"),
                textInputAction: TextInputAction.next,
                controller: nameController,
              ),
              TextFormField(
                autocorrect: false,
                decoration: const InputDecoration(labelText: "Posisi"),
                textInputAction: TextInputAction.next,
                controller: positionController,
              ),
              TextFormField(
                  autocorrect: false,
                  decoration: const InputDecoration(labelText: "Image URL"),
                  textInputAction: TextInputAction.done,
                  controller: imageController,
                  onEditingComplete: editPlayer),
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                  onPressed: editPlayer,
                  child: const Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
