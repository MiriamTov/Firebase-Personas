import 'dart:html';
import 'dart:js_util';

import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getPeople() async {
  List people = [];

  QuerySnapshot querySnapshot = await db.collection('Persona').get();

  for (var doc in querySnapshot.docs) {
    Map<String, dynamic> data = doc.data()! as Map<String, dynamic>;
    Map person = {
      "name": data['name'],
      "age": data['age'],
      "uid": doc.id,
    };

    people.add(person);
  }

  return people;
}

//guardar un name en base de datos
Future<void> addPeople(String name, String age) async {
  await db.collection("Persona").add({"name": name, "age": age});
}

//actualizar un name en base de datos
Future<void> updatePeople(String uid, String newName, String newAge) async {
  await db.collection("Persona").doc(uid).set({"name": newName, "age": newAge});
}

//Borrar datos de Firebase
Future<void> deletePeople(String uid) async {
  await db.collection("Persona").doc(uid).delete();
}
