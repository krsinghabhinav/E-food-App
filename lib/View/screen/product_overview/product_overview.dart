import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/View/screen/review_cart/review.dart';
import 'package:demoteteee/widget/countitem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../providers/wishlist_provider.dart';

enum SigninCharactor { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  final int productPrices;
  final String productId;

  const ProductOverview({
    super.key,
    this.productName = '',
    this.productImage = '',
    this.productPrices = 0,
    this.productId = '',
  });

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  bool wishListBool = false;
  SigninCharactor _charactor = SigninCharactor.fill;

  Widget bottomNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color textColor,
    required String title,
    required IconData iconData,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          color: backgroundColor,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 25,
                color: iconColor,
              ),
              const SizedBox(width: 5),
              Text(
                title,
                style: TextStyle(color: textColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getWihListBool() {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) {
      if (this.mounted) {
        if (value.exists) {
          setState(() {
            wishListBool = value.get("wishList");
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    WishlistProvider wishlistProvider = Provider.of(context);
    getWihListBool();
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            onTap: () {
              setState(() {
                wishListBool = !wishListBool;
                if (wishListBool == true) {
                  wishlistProvider.addwishListItem(
                    wishListId: widget.productId,
                    wishListName: widget.productName,
                    wishListImage: widget.productImage,
                    wishListPrice: widget.productPrices,
                    wishListQuantity: 2,
                  );
                } else {
                  wishlistProvider.wishListDelete(widget.productId);
                }
              });
            },
            backgroundColor: Colors.black,
            textColor: Colors.white,
            iconColor: Colors.grey,
            title: "Add to Watchlist",
            iconData: wishListBool ? Icons.favorite : Icons.favorite_outline,
          ),
          bottomNavigatorBar(
            backgroundColor: const Color.fromARGB(255, 230, 208, 10),
            textColor: Colors.white,
            iconColor: Colors.grey,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
            onTap: () {
              Get.to(ReviewCartView());
            },
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        title: const Text(
          "Product View",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      widget.productName,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "\$${widget.productPrices}",
                      style: const TextStyle(fontSize: 19),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 250,
                      child: Image.asset(
                        widget.productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      "Available Options",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 5,
                              backgroundColor: Colors.green,
                            ),
                            Radio<SigninCharactor>(
                              value: SigninCharactor.fill,
                              groupValue: _charactor,
                              activeColor: Colors.green,
                              onChanged: (SigninCharactor? value) {
                                setState(() {
                                  _charactor = value!;
                                });
                              },
                            ),
                          ],
                        ),
                        const Text(
                          "\$50",
                          style: TextStyle(fontSize: 20),
                        ),
                        CountAddRemoveitem(
                          productId: widget.productId,
                          productImage: widget.productImage,
                          productName: widget.productName,
                          productprice: widget.productPrices,
                        )

                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //     horizontal: 18,
                        //     vertical: 5,
                        //   ),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(20),
                        //     border: Border.all(color: Colors.grey),
                        //   ),
                        //   child: const Row(
                        //     children: [
                        //       Icon(Icons.add),
                        //       SizedBox(width: 4),
                        //       Text(
                        //         "ADD",
                        //         style: TextStyle(fontSize: 16),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this Product",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "A product description is a marketing tool that explains the features, benefits, and value of a product to potential customers. It can be presented as a short paragraph, bulleted list, or a single sentence. The goal of a product description is to help customers understand the product and encourage them to make a purchase.",
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
