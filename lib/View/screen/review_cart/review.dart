import 'package:demoteteee/models/reviewCart.dart';
import 'package:demoteteee/providers/review_cart_provider.dart';
import 'package:demoteteee/widget/SingleItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ReviewCartView extends StatefulWidget {
  const ReviewCartView({super.key});

  @override
  State<ReviewCartView> createState() => _ReviewCartViewState();
}

class _ReviewCartViewState extends State<ReviewCartView> {
  late ReviewCartProvider reviewCartProvider;

  @override
  void initState() {
    super.initState();
    // Fetch the review cart data once when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reviewCartProvider =
          Provider.of<ReviewCartProvider>(context, listen: false);
      reviewCartProvider.getReviewCartDataList();
    });
  }

  Future<void> _refreshProduct() async {
    await reviewCartProvider.getReviewCartDataList();
  }

  // Moved the showAlertDialog function outside initState
  void showAlertDialog(BuildContext context, ReviewCartModel delete) {
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
        reviewCartProvider.reviewCartDeleteData(delete.cartId);
        setState(() {
          // Triggers UI refresh after deletion
          reviewCartProvider.getReviewCartDataList();
        });
        Get.back();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Cart Product"),
      content: const Text("Are you sure you want to delete this cart product?"),
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
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);

    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text(
          "Total Amount",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
          ),
        ),
        subtitle: const Text(
          "\$1500.00 ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 29, 221, 39),
            fontSize: 16,
          ),
        ),
        trailing: Container(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 230, 6),
              borderRadius: BorderRadius.circular(30)),
          child: const Center(
            child: Text(
              "Submit",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 83, 81, 81),
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: const Text(
          "Review Cart",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshProduct,
        child: reviewCartProvider.geCartDataList.isEmpty
            ? const Center(child: Text('No items in the cart'))
            : ListView.builder(
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: reviewCartProvider.geCartDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  ReviewCartModel cartItem =
                      reviewCartProvider.geCartDataList[index];
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      SingleItem(
                        isBool: false,
                        iswishlistBool: true,
                        productName: cartItem.cartName,
                        productImage: cartItem.cartImage,
                        productPrices: cartItem.cartPrice,
                        productId: cartItem.cartId,
                        productQuantity: cartItem.cartQuantity,
                        onDelete: () => showAlertDialog(context, cartItem),
                      ),
                    ],
                  );
                },
              ),
      ),
    );
  }
}
