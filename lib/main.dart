import 'package:flutter/material.dart';
//import de Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_fire/pages/add_name_page%20copy.dart';
import 'package:flutter_fire/pages/edit_name_page.dart';
import 'package:flutter_fire/firebase_service.dart';
import 'package:flutter_fire/pages/home_pages.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddNamePage(),
        '/edit': (context) => const EditNamePage(),
      },
    );
  }
}
