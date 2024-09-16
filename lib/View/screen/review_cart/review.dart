import 'package:demoteteee/models/reviewCart.dart';
import 'package:demoteteee/providers/review_cart_provider.dart';
import 'package:demoteteee/widget/SingleItem.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewCartView extends StatefulWidget {
  const ReviewCartView({super.key});

  @override
  State<ReviewCartView> createState() => _ReviewCartViewState();
}

class _ReviewCartViewState extends State<ReviewCartView> {
  @override
  void initState() {
    super.initState();
    // Fetch the review cart data once when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ReviewCartProvider>(context, listen: false)
          .getReviewCartDataList();
    });
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider =
        Provider.of<ReviewCartProvider>(context);

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
      body: reviewCartProvider.geCartDataList.isEmpty
          ? const Center(child: Text('No items in the cart'))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: reviewCartProvider.geCartDataList.length,
              itemBuilder: (BuildContext context, int index) {
                ReviewCartModel cartItem =
                    reviewCartProvider.geCartDataList[index];
                return Column(
                  children: [
                    const SizedBox(height: 10),
                    SingleItem(
                      isBool: false,
                      productName: cartItem.cartName,
                      productImage: cartItem.cartImage, // Correct name
                      productPrices: cartItem.cartPrice,
                      productId: cartItem.cartId,
                      productQuantity: cartItem.cartQuantity,
                    ),
                  ],
                );
              },
            ),
    );
  }
}
