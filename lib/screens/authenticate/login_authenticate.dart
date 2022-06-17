import 'package:app_verteilte_systeme/buttons/login_submit_button.dart';
import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Anmeldung für Lunch Break'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0),
        child: LoginSubmitButton(
            colour: Colors.orange,
            title: 'Anmelden',
            //ElevatedButton(
            //child: const Text('Anmelden'),
            onPressed: () {
            Navigator.pushNamed(context, 'home_screen');
          //child: Text('Anmelden'),
          /*onPressed: () async {
            //dynamic result = await _authService.loginEmailPasswort();
              if (result == null) {
                print('Error bei Anmedung');
              } else {
                print('Angemeldet');
                print(result);
              }*/
          }
        ),

      ),

    );
  }
}
