import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Center(
                child: ElevatedButton(
                      child: const Text('Nächste Seite'),
                      onPressed: () {
                      Navigator.pushNamed(context, 'home_screen');
                    },
                ),
              ),
        ));
  }
}