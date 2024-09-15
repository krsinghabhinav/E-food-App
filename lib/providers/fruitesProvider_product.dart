import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/models/productsModel.dart';
import 'package:flutter/material.dart';

class Fruitesprovider with ChangeNotifier {
  bool isLoading = false;
  ProductModel productModel = ProductModel();

  List<ProductModel> fruitsproductlist = [];

  Future<void> fetchFruitesProduction() async {
    List<ProductModel> newfruitsList = [];

    try {
      isLoading = true;
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection("fruitsProduct").get();
      value.docs.forEach(
        (element) {
          print("fruites---------------------------------${element.data()}");
          productModel = ProductModel(
            productImage: element.get("productImage"),
            productName: element.get("productName"),
            productPrices: element.get("productPrices"),
          );
          newfruitsList.add(productModel);
        },
      );
      fruitsproductlist = newfruitsList;
      isLoading = false;
      notifyListeners();
    } catch (e) {
      print("Error fetching data:$e");
      isLoading = false;
      notifyListeners();
    }
  }

  List<ProductModel> get getFruitesdatalist {
    return fruitsproductlist;
  }
}
