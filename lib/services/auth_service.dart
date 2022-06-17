import 'package:firebase_auth/firebase_auth.dart';

class AuthService {

  final FirebaseAuth _authService = FirebaseAuth.instance;

  //Anmelden mit Email und Passwort
  /*
  Future loginEmailPasswort() async {
    try {
      AuthResult result = await _authService.signInWithEmailAndPassword(
          email: email,
          password: password,
      );
      FirebaseUser user = result.user;
      return user;
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  */
  //Registrieren mit Email und Passwort

  //Abmelden mit Email und Passwort

}
