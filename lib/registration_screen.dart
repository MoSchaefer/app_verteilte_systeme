import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lunch break Registrierung'),
      ),
      //body: Center(
        body: Center(
          child: Container(
              //mainAxisAlignment: MainAxisAlignment.center,
              padding: const EdgeInsets.only(
                left: 50.0,
                top: 100.0,
                right: 60.0,
                bottom: 100.0,
              ),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/logo_image.png"),
                  fit: BoxFit.cover,
                ),
                /*border: Border(
                  top: BorderSide(width: 16.0, color: Colors.lightBlue.shade50),
                  bottom: BorderSide(width: 16.0, color: Colors.lightBlue.shade900),
                ),*/
              ),
              child: const Text('', textAlign: TextAlign.center),
            ),
        /*child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Bitte hinterlegen Sie hier Ihre persönlichen Daten!',
            ),
          ],

        ),*/ // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
