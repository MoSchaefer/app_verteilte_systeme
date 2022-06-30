import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {

    final products = Provider.of<QuerySnapshot>(context);
    //print(products.documents);
    for (var doc in products.documents) {
      print(doc.data);
    }

    return Container(

    );
  }
}