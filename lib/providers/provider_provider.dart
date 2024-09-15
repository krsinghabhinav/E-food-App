import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:demoteteee/models/productsModel.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;
  ProductModel productModel = ProductModel();

  List<ProductModel> search = [];
  getproductModel(QueryDocumentSnapshot element) {
    productModel = ProductModel(
      productImage: element.get("productImage"),
      productName: element.get("productName"),
      productPrices: element.get("productPrices"),
    );
    search.add(productModel);
  }

  List<ProductModel> herbsProductList = [];

  // Fetch herbs products from Firestore
  Future<void> fetchHerbsProduction() async {
    List<ProductModel> newList = [];

    try {
      isLoading = true;
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection("HerbsProducts").get();
      for (var element in value.docs) {
        print("fetch data...........................${element.data()}");
        getproductModel(element);
        newList.add(productModel);
      }
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

  /////////////////////////////////////////////////////////
  List<ProductModel> fruitsProductList = [];

  // Fetch herbs products from Firestore
  Future<void> fetchFruitProduction() async {
    List<ProductModel> newList = [];

    try {
      isLoading = true;
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection("fruitsProduct").get();
      for (var element in value.docs) {
        print("fetch data...........................${element.data()}");
        getproductModel(element);
        newList.add(productModel);
      }
      fruitsProductList = newList;
      isLoading = false;
      notifyListeners(); // Notify listeners after data is fetched
    } catch (error) {
      print("Error fetching data: $error");
      isLoading = false;
      notifyListeners();
    }
  }

  List<ProductModel> get getfruitesProductionDataList {
    return herbsProductList;
  }

  List<ProductModel> get getAllSearchProdut {
    return search;
  }
}





  ///////////////////////////////////////////////////////////////////////
  


  

