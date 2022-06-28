import 'package:app_verteilte_systeme/home_screen.dart';
import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:app_verteilte_systeme/screens/authenticate/registration_screen.dart';
import 'package:flutter/material.dart';

class RegistrationSubmitButton extends StatelessWidget {
  RegistrationSubmitButton(
      {required this.colour, required this.title, required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  final AuthService _authService = AuthService();
  final _fromKey = GlobalKey<FormState>();

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
              //if (_fromKey.currentState.validate()) {
                //dynamic result = await _authService.registrationEmailPasswort(
                    //email, password);
                //if (result == null) {

                  //setState(() => error = 'Bitte gib eiene gültige Email-Adresse ein');
                  //}
                //print(password);
                },
              //},
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