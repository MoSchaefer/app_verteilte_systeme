import 'package:flutter/material.dart';
import 'rounded_button.dart';

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
          child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
                RoundedButton(
                      colour: Colors.orange,
                      title: 'Anmelden',
                //ElevatedButton(
                      //child: const Text('Anmelden'),
                      onPressed: () {
                      Navigator.pushNamed(context, 'home_screen');
                    },
                ),
                RoundedButton(
                      colour: Colors.orange,
                      title: 'Registrieren',
                //ElevatedButton(
                      //child: const Text('Registrieren'),
                      onPressed: () {
                      Navigator.pushNamed(context, 'home_screen');
                      }),
            ]),
        ),
        ),
    );
  }
}