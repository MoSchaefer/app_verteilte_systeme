
// Eigenlösung
/*
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
*/

// Videolösung

import 'package:app_verteilte_systeme/screens/home/home_screen.dart';
import 'package:app_verteilte_systeme/screens/authenticate/start_screen.dart';
import 'package:app_verteilte_systeme/screens/wrapper.dart';
import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:app_verteilte_systeme/models/user_model.dart';
/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}*/
/*
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        title: 'lunch break',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
      ),
    );
  }
}


*/

//void main() => runApp(MyApp());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AuthService>(
              create: (_) => AuthService()
          ),

          StreamProvider(
            create: (context) => context.read<AuthService>().authStateChanges, initialData: null,
          )
        ],
        child: MaterialApp(
          title: 'lunch break',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: AuthenticationWrapper(),
        )
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User?>();

    if(firebaseUser != null){
      print("ja");
      return HomeScreen();
    }
    print("nein");
    return StartScreen();
  }
}

/*class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //return MaterialApp(
    return StreamProvider<UserModel?>.value(
        initialData: UserModel(uid: ''),       //????????????????????????????????
        value: AuthService().user,
        child: MaterialApp(
        home: Wrapper(),
        title: 'lunch break',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.orange,
        ),
      ),
    );
  }
}
*/
