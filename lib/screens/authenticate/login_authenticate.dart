//import 'dart:ffi';
import 'package:app_verteilte_systeme/buttons/login_submit_button.dart';
import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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
        title: Text('Anmeldung für Lunch Break App'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
            vertical: 20.0,
            horizontal: 50.0),
          //child: LoginSubmitButton(
          child: Form(
            key: _fromKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                return 'Please enter some text';
    }
    return null;
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
                /*LoginSubmitButton(
                    colour: Colors.orange,
                    title: 'Anmelden',
                    onPressed: () async {
                      //print(email);
                      //print(password);
                      //if (_fromKey.currentState.validate()){
                        dynamic result = await _authService.loginEmailPasswort(email, password);
                        if(result == null){
                          setState(() => error = 'Email oder Passwort ungültig');
                        //}
                      }
                    }
                  ),*/SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.orange,
                    child: Text(
                      'Anmaelden',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      print(email);
                      print(password);
                    }
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
            //title: 'Anmelden',
            //ElevatedButton(
            //child: const Text('Anmelden'),
            //onPressed: () {
            //Navigator.pushNamed(context, 'home_screen');
          child: Text('Anmelden'),
          onPressed: () async {
            dynamic result = await _authService.loginEmailPasswort();
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
