import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/models/reviewCart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ReviewCartProvider with ChangeNotifier {
  bool isLoading = false;
  // Method to add data to ReviewCart
  Future<void> addReviewCartData({
    String cartId = '',
    String cartName = '',
    String cartImage = '',
    int cartPrice = 0, // Changed from cartprice to cartPrice
    int cartQuantity = 0,
  }) async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      'cartId': cartId,
      'cartName': cartName,
      'cartImage': cartImage,
      'cartPrice': cartPrice, // Fixed case to cartPrice
      'cartQuantity': cartQuantity,
    });
  }

  List<ReviewCartModel> reviewCartDataList = [];

  // Method to get the review cart data
  Future<void> getReviewCartDataList() async {
    isLoading = true;
    List<ReviewCartModel> reviewnewList = [];

    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .get();

    for (var element in reviewCartValue.docs) {
      print("review data-------------${element.data()}");
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartName: element.get("cartName"),
        cartImage: element.get("cartImage"),
        cartPrice: element.get("cartPrice"), // Corrected cartPrice field name
        cartQuantity: element.get("cartQuantity"),
      );
      reviewnewList.add(reviewCartModel);
    }

    reviewCartDataList = reviewnewList;
    notifyListeners();
  }

  // Getter method for accessing the review cart data list
  List<ReviewCartModel> get geCartDataList {
    return reviewCartDataList;
  }
}
