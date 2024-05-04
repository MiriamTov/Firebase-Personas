import 'package:flutter/material.dart';
import 'package:flutter_fire/firebase_service.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController ageController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = arguments['name'];
    ageController.text = arguments['age'];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Person'),
      ),
      body: Column(
        children: [
          TextField(
            controller: nameController,
            decoration: const InputDecoration(
              hintText: 'Ingrese la modificacion',
            ),
          ),
          TextField(
            controller: ageController,
            decoration: const InputDecoration(
              hintText: 'Ingrese la modificacion',
            ),
          ),
          ElevatedButton(
              onPressed: () async {
                await updatePeople(
                  arguments['uid'],
                  nameController.text,
                  ageController.text,
                ).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text("Actualizar"))
        ],
      ),
    );
  }
}
