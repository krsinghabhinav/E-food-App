import 'package:demoteteee/models/productsModel.dart';
import 'package:demoteteee/models/reviewCart.dart';
import 'package:demoteteee/providers/review_cart_provider.dart';
import 'package:demoteteee/providers/wishlist_provider.dart';
import 'package:demoteteee/widget/SingleItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  late WishlistProvider wishlistProvider;

  // Moved the showAlertDialog function outside initState
  void showAlertDialog(BuildContext context, ProductModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: const Text("No"),
      onPressed: () {
        Get.back();
      },
    );

    Widget YesButton = TextButton(
      child: const Text("Yes"),
      onPressed: () {
        // Call the delete function and refresh the UI
        setState(() {
          wishlistProvider.wishListDelete(delete.productId);
          // Triggers UI refresh after deletion
          // wishlistProvider.getWishListData();
        });
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("WishList Product"),
      content:
          const Text("Are you sure you want to delete this wishlist product?"),
      actions: [
        cancelButton,
        YesButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    wishlistProvider = Provider.of(context);
    wishlistProvider.getWishListData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: const Text(
          "WishList",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: AlwaysScrollableScrollPhysics(),
        itemCount: wishlistProvider.getWishListdatalist.length,
        itemBuilder: (BuildContext context, int index) {
          ProductModel data = wishlistProvider.getWishListdatalist[index];
          return Column(
            children: [
              const SizedBox(height: 10),
              SingleItem(
                isBool: false,
                // iswishlistBool: false,
                productName: data.productName,
                productImage: data.productImage,
                productPrices: data.productPrices,
                productId: data.productId,
                productQuantity: data.productQuantity,
                onDelete: () => showAlertDialog(context, data),
              ),
            ],
          );
        },
      ),
    );
  }
}
