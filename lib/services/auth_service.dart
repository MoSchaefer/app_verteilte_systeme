import 'package:app_verteilte_systeme/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _authService = FirebaseAuth.instance;
  String email = '';
  String password = '';

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
  Future loginEmailPasswort(
      String email,
      String password)
  async {
    try{
      UserCredential result = await _authService.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = result.user;
      return _UserFromFirebaseUser(user);
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