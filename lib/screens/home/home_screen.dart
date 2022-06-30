import 'package:app_verteilte_systeme/services/auth_service.dart';
import 'package:flutter/material.dart';
import '../../second_screen.dart';
import 'package:app_verteilte_systeme/services/database_service.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_verteilte_systeme/screens/home/product_list.dart';

class HomeScreen extends StatefulWidget {

  //final AuthService _authService = AuthService();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final AuthService _authService = AuthService();

  int _selectedIndex = 0;
  /*
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[

    Text(
      'Seite 0: Home',
      style: optionStyle,
    ),
    Text(
      'Seite 1: Bestellliste',
      style: optionStyle,
    ),
    Text(
      'Seite 2: Warenkorb',
      style: optionStyle,
    ),
    Text(
      'Seite 3: Profil',
      style: optionStyle,
    ),
  ];
  */

  final List<Widget> _pages = <Widget>[
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Settings"),
          Icon(Icons.settings),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Home"),
          Icon(Icons.home),
        ],
      ),
    ),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text("Messages"),
          Icon(Icons.message),
        ],
      ),
    ),
    Center(
      child: ProductList(),
      ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value
      (value: DatabaseService().products,
        //initialData: initialData)
    //return Scaffold(
      child: Scaffold(
      appBar: AppBar(
        title: Text('lunch break App'),
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('Abmelden'),
              onPressed: () async {
                await _authService.logout();
              },
              )

        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              //color: Colors.black,
            ),
            label: 'Home',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            label: 'Bestellliste',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Warenkorb',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profil',
            backgroundColor: Colors.orange,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondScreen()),
          );
        },
        child: const Icon(Icons.shopping_cart),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
/*
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('lunch break neue Seite'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Sie befinden sich auf einer neuen Seite!',
            ),
          ],

        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
*/