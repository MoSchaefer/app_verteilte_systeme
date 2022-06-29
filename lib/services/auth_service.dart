import 'package:app_verteilte_systeme/home_screen.dart';
import 'package:app_verteilte_systeme/models/user_model.dart';
import 'package:app_verteilte_systeme/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class AuthService {

  final FirebaseAuth _authService = FirebaseAuth.instance;

  String email = '';
  String password = '';

  Stream<User?> get authStateChanges => _authService.authStateChanges();
  final databaseRef = FirebaseDatabase.instance.ref();

  //Erstellt ein User-Object basierend auf FirebaseUser
  UserModel? _UserFromFirebaseUser(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  //Ändert den user stream
  //Stream<FirebaseUser> get user {
  Stream<UserModel?> get user {
    return _authService.authStateChanges()
        .map((User? user) => _UserFromFirebaseUser(user));
        //.map(_userFromFirebaseUser());
  }

  //Anmelden mit Email und Passwort
  Future<UserModel?> loginEmailPasswort({
      required String email,
      required String password,
      required BuildContext context})
  async {
    try{
      print(email);
      print(password);
      UserCredential result = await _authService.signInWithEmailAndPassword(

      //await _authService.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => HomeScreen())
      );
      User? user = result.user;
      return _UserFromFirebaseUser(user);
      //return "anmeldung erfolgreich";

    } catch(error){
      print(error.toString());
      return null;
    }
  }
  /*Future loginEmailPasswort() async {
    try {
      AuthResult result = await _authService.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      User user = result.user;
      //return user;
      return _userFromFirebaseUser(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }*/

  //Registrieren mit Email und Passwort
  Future registrationEmailPasswort(
      String email,
      String password)
  async {
    try{
      UserCredential result = await _authService.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
      User user = result.user!;

      //erstellen eines Dokumets für user mit der uid
      //await DatabaseService(uid: user.uid).updateUserData('new product', 0.0);
      return _UserFromFirebaseUser(user);
    } catch(error){
      print(error.toString());
      return null;
    }
  }


  //Abmelden
  Future logout() async {
    try {
      return await _authService.signOut();
    } catch (error){
      print(error.toString());
      return null;
    }
  }
}