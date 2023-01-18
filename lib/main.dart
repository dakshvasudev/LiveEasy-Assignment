import 'package:flutter/material.dart';
import 'package:liveeasy_internship_assign/language_screen.dart';
import 'package:firebase_core/firebase_core.dart';

Future<Null> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LanguageScreen(),
    );
  }
}