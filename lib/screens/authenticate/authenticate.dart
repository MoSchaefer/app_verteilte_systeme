import 'package:app_verteilte_systeme/screens/authenticate/login_authenticate.dart';
import 'package:app_verteilte_systeme/screens/authenticate/start_screen.dart';
import 'package:flutter/material.dart';


class Authenticate extends StatefulWidget {
  const Authenticate({Key? key}) : super(key: key);

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: StartScreen(),
    );
  }
}
