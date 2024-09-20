import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/models/productsModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishlistProvider with ChangeNotifier {
  void addwishListItem({
    String wishListId = '',
    String wishListName = '',
    String wishListImage = '',
    int wishListPrice = 0,
    int wishListQuantity = 0,
  }) async {
    await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set({
      'wishListId': wishListId,
      'wishListName': wishListName,
      'wishListImage': wishListImage,
      'wishListPrice': wishListPrice,
      'wishListQuantity': wishListQuantity,
      'wishList': true,
    });
    notifyListeners();
  }

////////////////////////get wishlist///////////////////
  List<ProductModel> wishlistdata = [];

  getWishListData() async {
    List<ProductModel> newListwishlist = [];

    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach((element) {
      ProductModel productModel = ProductModel(
        productId: element.get('wishListId'),
        productImage: element.get('wishListImage'),
        productName: element.get('wishListName'),
        productPrices: element.get('wishListPrice'),
        productQuantity: element.get('wishListQuantity'),
      );
      newListwishlist.add(productModel);
    });
    wishlistdata = newListwishlist;
    notifyListeners();
  }

  List<ProductModel> get getWishListdatalist {
    return wishlistdata;
  }

  ////////////////////delete/////////////////////

  wishListDelete(wishListId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .delete();
  }
}
