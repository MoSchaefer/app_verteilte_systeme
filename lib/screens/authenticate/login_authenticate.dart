//import 'dart:ffi';
import 'package:app_verteilte_systeme/buttons/login_submit_button.dart';
import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:app_verteilte_systeme/buttons/button.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final AuthService _authService = AuthService();
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passwortController = TextEditingController();


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
                //buildField("email", 0xf04b6, mailController,60),
                //buildField("passwort", 0xf04b6, passwortController,60),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  controller: mailController,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Passwort'),
                  controller: passwortController,
                  obscureText: true,
                ),
                /*TextFormField(
                  //decoration: InputDecoration(labelText: 'Email'),

                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
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
                  ),*/
                */SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.orange,
                    child: Text(
                      'Anmelden',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      print(email);
                      print(password);
                      context.read<AuthService>().loginEmailPasswort(
                          email: mailController.text,
                          password: passwortController.text
                      ,context:context,
                      );
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

  Widget buildField(var Text, int x, TextEditingController mailcontroller, double y) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: 18),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                    offset: Offset(0,2)
                )
              ]
          ),
          height: y,
          child: TextField(
            textInputAction: TextInputAction.newline,
            maxLines: null,
            expands: true,
            controller : mailcontroller,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Colors.black87,
            ),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(IconData(x, fontFamily: 'MaterialIcons')),
                hintText: Text,
                hintStyle: TextStyle(
                    color: Colors.black38
                )
            ),
          ),
        )
      ],
    );


  }
}
