import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/providers/review_cart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CountAddRemoveitem extends StatefulWidget {
  final String productImage;
  final String productName;
  final String productId;
  int productprice;
  // int productQuantity;

  CountAddRemoveitem({
    super.key,
    this.productImage = '',
    this.productName = '',
    this.productId = '',
    this.productprice = 0,
    // this.productQuantity = 0,
  });

  @override
  State<CountAddRemoveitem> createState() => _CountAddRemoveitemState();
}

class _CountAddRemoveitemState extends State<CountAddRemoveitem> {
  late ReviewCartProvider reviewCartProvider;
  int count = 1;
  bool isTrue = false;

  @override
  void initState() {
    super.initState();
    getAddandQuality(); // Call this only once when the widget is initialized
  }

  getAddandQuality() async {
    DocumentSnapshot productDoc = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("YourReviewCart")
        .doc(widget.productId) // Fetch the specific product document
        .get();

    if (this.mounted) {
      if (productDoc.exists) {
        print('getAddandQuality=====================${productDoc.data()}');
        setState(() {
          count = productDoc.get("cartQuantity");
          isTrue = productDoc.get("isAdd");
        });
      } else {
        setState(() {
          isTrue = false;
          // Set to false if the product is not found in the cart
          print("product not jjjjjjjjjjjjjj");
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);

    return Container(
        padding: const EdgeInsets.only(left: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 30,
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        print(
                            'product id  ----------------------    ${widget.productId}');
                        if (count == 1) {
                          setState(() {
                            isTrue = false;
                            reviewCartProvider
                                .reviewCartDeleteData(widget.productId);
                          });
                        } else {
                          setState(() {
                            count--;

                            reviewCartProvider.updateReviewCartData(
                              cartId: widget.productId,
                              cartImage: widget.productImage,
                              cartName: widget.productName,
                              cartPrice: widget.productprice,
                              cartQuantity: count,
                            );
                          });
                        }
                      },
                      child: Icon(Icons.remove)),
                  SizedBox(width: 0),
                  Text(
                    ' $count',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 0),
                  InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                          reviewCartProvider.updateReviewCartData(
                            cartId: widget.productId,
                            cartImage: widget.productImage,
                            cartName: widget.productName,
                            cartPrice: widget.productprice,
                            cartQuantity: count,
                          );
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              )
            : Center(
                child: Container(
                  width: 50,
                  margin: EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue = true;
                        reviewCartProvider.addReviewCartData(
                          cartId: widget.productId,
                          cartImage: widget.productImage,
                          cartName: widget.productName,
                          cartPrice: widget.productprice,
                          cartQuantity: count,
                        );
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("ADD"),
                    ),
                  ),
                ),
              ));
  }
}
