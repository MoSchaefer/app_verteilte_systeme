import 'package:app_verteilte_systeme/screens/authenticate/authenticate.dart';
import 'package:app_verteilte_systeme/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return StartScreen or HomeScreen
    return Authenticate();
  }
}
