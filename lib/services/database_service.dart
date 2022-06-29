//import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_verteilte_systeme/models/user_model.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid});


  //collection reference
  final CollectionReference groceriesList = FirebaseFirestore.instance.collection('groceries');

  Future updateUserData(String name, double price) async {
    return await groceriesList.document(uid).setData({
      'name': name,
      'price': price,
    });
  }

}