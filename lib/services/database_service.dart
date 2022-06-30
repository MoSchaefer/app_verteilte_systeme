//import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:app_verteilte_systeme/models/user_model.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ required this.uid});


  //collection reference
  final CollectionReference productList = FirebaseFirestore.instance.collection('products');

  Future updateUserData(String productName, double productPrice) async {
    return await productList.document(uid).setData({
      'name': productName,
      'price': productPrice,
    });
  }

/*
  //test Erstellen eises Dokumets
  var productName,productPrice;
  create()async{
      DocumentReference documentReference =await FirebaseFirestore.instance.collection("productList").add(
        {
          'ProductName':productName,
          'ProductPrice':productPrice,
        }
      );
  }*/

  //Stream zu Firestore
  Stream<QuerySnapshot> get products {
    return productList.snapshots();
  }
}