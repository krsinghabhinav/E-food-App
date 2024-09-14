import 'package:flutter/material.dart';

enum SigninCharactor { fill, outline }

class ProductOverview extends StatefulWidget {
  final String productName;
  final String productImage;
  const ProductOverview(
      {super.key, this.productName = '', this.productImage = ''});

  @override
  State<ProductOverview> createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  SigninCharactor _charactor = SigninCharactor.fill;

  Widget bottomNavigatorBar({
    required Color iconColor,
    required Color backgroundColor,
    required Color textColor,
    required String title,
    required IconData iconData,
  }) {
    return Expanded(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        children: [
          bottomNavigatorBar(
            backgroundColor: Colors.black,
            textColor: Colors.white,
            iconColor: Colors.grey,
            title: "Add to Watchlist",
            iconData: Icons.favorite_outline,
          ),
          bottomNavigatorBar(
            backgroundColor: const Color.fromARGB(255, 230, 208, 10),
            textColor: Colors.white,
            iconColor: Colors.grey,
            title: "Go To Cart",
            iconData: Icons.shop_outlined,
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: true,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        title: Text(
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
            Container(
              width: double.infinity,
              // padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    title: Text(
                      widget.productName,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      "\$50",
                      style: TextStyle(fontSize: 19),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 250,
                      child: Image.asset(
                        widget.productImage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 13),
                    child: Text(
                      "Available Options",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
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
                        Text(
                          "\$50",
                          style: TextStyle(fontSize: 20),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add),
                              SizedBox(width: 4),
                              Text(
                                "ADD",
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
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
