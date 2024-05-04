import 'package:flutter/material.dart';
import 'package:flutter_fire/firebase_service.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Firebase App Bar'),
        backgroundColor: Colors.blueAccent,
      ),
      body: FutureBuilder(
          future: getPeople(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(snapshot.data?[index]['name']),
                      subtitle: Text(snapshot.data?[index]['age']),
                      onTap: (() async {
                        await Navigator.pushNamed(context, "/edit", arguments: {
                          "name": snapshot.data?[index]['name'],
                          "age": snapshot.data?[index]['age'],
                          "uid": snapshot.data?[index]['uid'],
                        });

                        setState(() {}); //actualiza widget
                      }),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () async {
                              await Navigator.pushNamed(context, "/edit",
                                  arguments: {
                                    "name": snapshot.data?[index]['name'],
                                    "age": snapshot.data?[index]['age'],
                                    "uid": snapshot.data?[index]['uid'],
                                  });

                              setState(() {}); //actualiza widget
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () async {
                              bool result = await showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Eliminar Persona"),
                                    content: const Text(
                                        "¿Está seguro de que desea eliminar esta persona?"),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                        child: const Text("Cancelar"),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          await deletePeople(
                                              snapshot.data?[index]['uid']);
                                          Navigator.pop(context, true);
                                        },
                                        child: const Text("Eliminar"),
                                      ),
                                    ],
                                  );
                                },
                              );

                              if (result == true) {
                                setState(() {});
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {}); //actualiza el widget
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
