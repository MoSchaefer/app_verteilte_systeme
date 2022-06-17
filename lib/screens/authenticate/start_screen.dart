import 'package:flutter/material.dart';
import 'package:app_verteilte_systeme/buttons/login_button.dart';
import 'package:app_verteilte_systeme/buttons/registration_button.dart';
import 'package:flutter/src/material/colors.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.grey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/start_image.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            //mainAxisAlignment: MainAxisAlignment.center,
            //width: 100.0,
            //height: 100.0,

          child: Container(
            //width: 100.0,
            //height: 100.0,
          decoration: new BoxDecoration(
              image: DecorationImage(

                  image: AssetImage("images/logo_image.png"),
                  fit: BoxFit.contain,

                  ),
                ),
            //child: const Text('', textAlign: TextAlign.center),


              child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Container(
          padding: const EdgeInsets.only(
              left: 1.0,
              top: 500.0,
              right: 1.0,
              bottom: 1.0,
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                LoginButton(
                      colour: Colors.orange.shade300,
                      title: 'Anmelden',
                //ElevatedButton(
                      //child: const Text('Anmelden'),
                      onPressed: () {
                      Navigator.pushNamed(context, 'home_screen');
                    },
                ),
                RegistrationButton(
                      colour: Colors.orange.shade600,
                      title: 'Registrieren',
                //ElevatedButton(
                      //child: const Text('Registrieren'),
                      onPressed: () {
                      Navigator.pushNamed(context, 'second_screen');
                      }),
            ]),
        ),
        ),
        ),
        ),
        ),
    );
  }
}