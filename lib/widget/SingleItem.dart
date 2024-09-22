import 'package:demoteteee/message/toastmesss.dart';
import 'package:demoteteee/providers/review_cart_provider.dart';
import 'package:demoteteee/widget/countitem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SingleItem extends StatefulWidget {
  bool isBool;
  String productImage;
  String productName;
  int productPrices;
  String productId;
  int productQuantity;
  final VoidCallback? onDelete;
  bool iswishlistBool;

  SingleItem({
    super.key,
    this.isBool = false,
    this.productName = '',
    this.productImage = '',
    this.productPrices = 0,
    this.productId = '',
    this.productQuantity = 0,
    this.onDelete,
    this.iswishlistBool = false,
  });

  @override
  _SingleItemState createState() => _SingleItemState();
}

class _SingleItemState extends State<SingleItem> {
  late ReviewCartProvider reviewCartProvider;
  late int count;

  @override
  void initState() {
    super.initState();
    count = widget.productQuantity;

    // Fetch the review cart data once when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reviewCartProvider =
          Provider.of<ReviewCartProvider>(context, listen: false);
      reviewCartProvider.getReviewCartDataList();
    });
  }

  // Function to simulate refreshing data
  Future<void> _refreshPage() async {
    // Simulate a network call or data fetching
    await Future.delayed(const Duration(seconds: 2));

    // Update your widget's state here with any data refresh (if needed)
    setState(() {
      // For example, you can update productQuantity or other data here
      count += 1; // Example: just increase product quantity
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh:
          _refreshPage, // The function to call when user pulls to refresh
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: Center(
                      child: Image.asset(
                          widget.productImage), // Ensure the path is correct
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      mainAxisAlignment: widget.isBool
                          ? MainAxisAlignment.spaceEvenly
                          : MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.productName,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "\$ ${widget.productPrices}",
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        widget.isBool
                            ? GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ListTile(
                                            title: Text('50 gram'),
                                            onTap: () {
                                              Get.back();
                                            },
                                          ),
                                          ListTile(
                                            title: Text('500 gram'),
                                            onTap: () {
                                              Get.back();
                                            },
                                          ),
                                          ListTile(
                                            title: Text('1 kg'),
                                            onTap: () {
                                              Get.back();
                                            },
                                          ),
                                          ListTile(
                                            title: Text('2 kg'),
                                            onTap: () {
                                              Get.back();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 35,
                                  decoration: BoxDecoration(
                                    color:
                                        const Color.fromARGB(55, 221, 219, 219),
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: const Color.fromARGB(
                                          255, 187, 185, 185),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8),
                                    child: Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Expanded(
                                          child: FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              "50 Gram",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w400,
                                                color:
                                                    Color.fromARGB(55, 0, 0, 0),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.arrow_drop_down),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            : const Text("50 Gram"),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    padding: widget.isBool
                        ? const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 30)
                        : const EdgeInsets.only(left: 0, top: 20),
                    child: widget.isBool
                        ? Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 0),
                                child: CountAddRemoveitem(
                                  productId: widget.productId,
                                  productImage: widget.productImage,
                                  productName: widget.productName,
                                  productprice: widget.productPrices,
                                ),
                              ),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: widget.onDelete,
                                  child: const Icon(
                                    Icons.delete,
                                    size: 40,
                                  ),
                                ),
                                widget.iswishlistBool
                                    ? Container(
                                        height: 35,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              55, 221, 219, 219),
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          border: Border.all(
                                            color: const Color.fromARGB(
                                                255, 187, 185, 185),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (count <= 1) {
                                                  // Show an error message when the count is at its minimum
                                                  ToastUtil.showError(
                                                      "You have reached the minimum limit");
                                                } else {
                                                  setState(() {
                                                    count--;
                                                  });
                                                  reviewCartProvider
                                                      .updateReviewCartData(
                                                    cartId: widget.productId,
                                                    cartName:
                                                        widget.productName,
                                                    cartQuantity: count,
                                                    cartImage:
                                                        widget.productImage,
                                                    cartPrice:
                                                        widget.productPrices,
                                                  );
                                                }
                                              },
                                              child: const Icon(
                                                Icons.remove,
                                                color: Color.fromARGB(
                                                    255, 187, 185, 185),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 5.0),
                                              child: Text(
                                                '$count',
                                                style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color.fromARGB(
                                                      255, 187, 185, 185),
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  count++;
                                                });
                                                reviewCartProvider
                                                    .updateReviewCartData(
                                                  cartId: widget.productId,
                                                  cartName: widget.productName,
                                                  cartQuantity: count,
                                                  cartImage:
                                                      widget.productImage,
                                                  cartPrice:
                                                      widget.productPrices,
                                                );
                                              },
                                              child: const Icon(
                                                Icons.add,
                                                color: Color.fromARGB(
                                                    255, 187, 185, 185),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    : Container(),
                              ],
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
          widget.isBool
              ? Container()
              : const Divider(
                  height: 1,
                  color: Colors.black,
                ),
        ],
      ),
    );
  }
}
