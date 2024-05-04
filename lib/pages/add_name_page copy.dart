import 'package:flutter/material.dart';
import 'package:flutter_fire/firebase_service.dart';

class AddNamePage extends StatefulWidget {
  const AddNamePage({super.key});

  @override
  State<AddNamePage> createState() => _AddNamePageState();
}

class _AddNamePageState extends State<AddNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController ageController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add Person'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Nuevo nombre',
                ),
              ),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                  hintText: 'Edad',
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await addPeople(nameController.text, ageController.text)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text("Guardar"))
            ],
          ),
        ));
  }
}
