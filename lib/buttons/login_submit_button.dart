import 'package:app_verteilte_systeme/home_screen.dart';
import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:app_verteilte_systeme/screens/authenticate/login_authenticate.dart';
import 'package:flutter/material.dart';
import 'package:app_verteilte_systeme/models/user_model.dart';

class LoginSubmitButton extends StatelessWidget {
  LoginSubmitButton(
      {required this.colour, required this.title, required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  final AuthService _authService = AuthService();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),

        child: MaterialButton(
            onPressed: () async {
              //dynamic result = await _authService.loginEmailPasswort(email, password);
              //if(result == null){
                //setState(() => error = 'Email oder Passwort ungültig');
                //}                                                         //Überprüfung der Gültigkeit der Daten
              //}
          },
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}