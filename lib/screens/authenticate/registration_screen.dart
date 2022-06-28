import 'package:flutter/material.dart';
import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:app_verteilte_systeme/buttons/registration_submit_button.dart';
import 'package:app_verteilte_systeme/models/user_model.dart';

class RegistrationScreen extends StatefulWidget {
  //const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  final AuthService _authService = AuthService();
  final _fromKey = GlobalKey<FormState>();

  // text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Registrierung für Lunch Break App'),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 50.0),
          //child: RegistrationSubmitButton(
          child: Form(
            key: _fromKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Email'),
                    //validator: (val) => val.isEmpty ? 'Gib eine Email-Adresse an' : null,
                    onChanged: (val) {
                      setState(() => email = val);
                    }
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Passwort'),
                    obscureText: true,
                    //validator: (val) => val.length < 6 ? 'Das Passwort muss länger als 6 Zeichen sein' : null,
                    onChanged: (val) {
                      setState(() => password = val);
                    }
                ),
                SizedBox(height: 20.0),
                /*RegistrationSubmitButton(
                    colour: Colors.orange,
                    title: 'Registrieren',
                    onPressed: () async {
                      //print(email);
                      //print(passwort);
                      //if (_fromKey.currentState.validate()){
                        dynamic result = await _authService.registrationEmailPasswort(email, password);
                        if(result == null){
                          setState(() => error = 'Bitte gib eine gültige Email-Adresse ein');
                        }
                      //}
                    }
                  ),*/
                RaisedButton(
                    color: Colors.orange,
                    child: Text(
                      'Registrieren',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      //if(_formKey.currentState.validate()){
                        dynamic result = await _authService.registrationEmailPasswort(email, password);
                        if(result == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        }
                      }
                    //}
                ),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 1),
                ),
              ],
            ),
          ),
          /*color: Colors.orange,
          title: 'Registrieren',
          //ElevatedButton(
          //child: const Text('Anmelden'),
          onPressed: () {
            Navigator.pushNamed(context, 'home_screen');
            //child: Text('Anmelden'),
            onPressed: () async {
            //dynamic result = await _authService.loginEmailPasswort();
              if (result == null) {
                print('Error bei Anmedung');
              } else {
                print('Angemeldet');
                print(result);
                print(result.uid);
              }
          }*/
      ),

    );
  }
}
