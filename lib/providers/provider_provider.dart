import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:demoteteee/models/productsModel.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;
  ProductModel productModel = ProductModel();

  getproductModel(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrices: element.get("productPrices"),
    );
  }

  List<ProductModel> herbsProductList = [];

  // Fetch herbs products from Firestore
  Future<void> fetchHerbsProduction() async {
    List<ProductModel> newList = [];

    try {
      isLoading = true;
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection("HerbsProducts").get();
      value.docs.forEach((element) {
        print("fetch data...........................${element.data()}");
        getproductModel(element);
        newList.add(productModel);
      });
      herbsProductList = newList;
      isLoading = false;
      notifyListeners(); // Notify listeners after data is fetched
    } catch (error) {
      print("Error fetching data: $error");
      isLoading = false;
      notifyListeners();
    }
  }

  List<ProductModel> get getHerbsProductionDataList {
    return herbsProductList;
  }
}
