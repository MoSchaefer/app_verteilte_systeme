import 'package:app_verteilte_systeme/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'start_screen.dart';
import 'home_screen.dart';
import 'second_screen.dart';
import 'login_screen.dart';
import 'registration_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'lunch break',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialRoute: 'start_screen',
      routes: {
        'start_screen': (context) => StartScreen(),
        'home_screen': (context) => HomeScreen(),
        'second_screen': (context) => SecondScreen(),
        'login_screen': (context) => LoginScreen(),
        'registration_screen': (context) => RegistrationScreen(),

      },
    );
  }
}