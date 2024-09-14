import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/models/productsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  ProductModel _productModel = ProductModel();

  List<ProductModel> herbsProduct = [];

  fetchHerbsProduction() async {
    QuerySnapshot value =
        await FirebaseFirestore.instance.collection("HerbsProducts").get();
    value.docs.forEach(
      (element) {
        print(element.data());
      },
    );
  }
}
