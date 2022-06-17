import 'package:app_verteilte_systeme/home_screen.dart';
import 'package:app_verteilte_systeme/screens/authenticate/login_authenticate.dart';
import 'package:flutter/material.dart';

class LoginSubmitButton extends StatelessWidget {
  LoginSubmitButton(
      {required this.colour, required this.title, required this.onPressed});
  final Color colour;
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: () {
            //Navigator.pushNamed(context, 'home_screen');
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
          //Go to login screen.
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