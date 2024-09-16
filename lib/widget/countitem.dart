import 'package:demoteteee/providers/review_cart_provider.dart';
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
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    print('product id  ----------------------    ${widget.productId}');
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
                        if (count == 1) {
                          setState(() {
                            isTrue = false;
                          });
                        } else {
                          setState(() {
                            count--;
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
