import 'package:demoteteee/providers/provider_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../widget/countitem.dart';

class SingleProduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final int productPrices;
  final VoidCallback? onTap;
  final String productId;

  const SingleProduct({
    super.key,
    this.productImage = '',
    this.productName = '',
    this.productId = '',
    this.productPrices = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, value, child) {
        return Stack(
          children: [
            // Your content
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    height: 260,
                    width: 180,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: onTap,
                            child: Image.asset(
                              productImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  productName,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  "\$ $productPrices /50 Gram",
                                  style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ListTile(
                                                    title: new Text('50 gram'),
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: new Text('500 gram'),
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: new Text('1 kg'),
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                  ListTile(
                                                    title: new Text('2 kg'),
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                  )
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          height: 30,
                                          child: const Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text("50Gram"),
                                              Icon(Icons.arrow_drop_down),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    CountAddRemoveitem(
                                      productName: productName,
                                      productId: productId,
                                      productImage: productImage,
                                      productprice: productPrices,
                                      // productQuantity: "1",
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
