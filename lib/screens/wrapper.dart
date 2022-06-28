import 'package:app_verteilte_systeme/screens/authenticate/authenticate.dart';
import 'package:app_verteilte_systeme/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:app_verteilte_systeme/models/user_model.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);
    //print(user);                                //kann weg wenn alles Funktioniert (ab hier logout)

    //return StartScreen or HomeScreen
    //return Authenticate();             //für test benötigt         //kann weg wenn alles Funktioniert (ab hier logout)

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
