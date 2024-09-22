import 'package:demoteteee/View/screen/review_cart/review.dart';
import 'package:demoteteee/providers/userProvider.dart';

import '30%off.dart';
import '../product_overview/product_overview.dart';
import '../search/searchView.dart';
import 'package:demoteteee/providers/provider_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import 'drawerScr.dart';
import 'onallvege.dart';
import 'signleCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider = ProductProvider();

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    await productProvider.fetchHerbsProduction();
    await productProvider.fetchFruitProduction();
  }

  // Method to refresh the screen programmatically
  void _refreshScreen() {
    setState(() {
      _fetchProducts();
    });
  }

  Widget _buildHerbProduct(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Herb Seasonings",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => SearchViewScreen(
                          searchList:
                              productProvider.getHerbsProductionDataList,
                        ));
                    print("View All tapped");
                  },
                  child: const Text(
                    "View All",
                    style: TextStyle(
                      color: Color.fromARGB(255, 102, 100, 100),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            )),
        productProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      productProvider.getHerbsProductionDataList.map((product) {
                    return SingleProduct(
                      onTap: () {
                        Get.to(ProductOverview(
                          productImage: product.productImage,
                          productName: product.productName,
                          productPrices: product.productPrices,
                          productId: product.productId,
                        ));
                      },
                      productImage: product.productImage,
                      productName: product.productName,
                      productPrices: product.productPrices,
                      productId: product.productId,
                    );
                  }).toList(),
                ),
              ),
      ],
    );
  }

  Widget _buildFreshProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Fresh Fruits",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SearchViewScreen(
                        searchList: productProvider.fruitsProductList,
                      ));
                  print("View All tapped");
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Color.fromARGB(255, 102, 100, 100),
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
        productProvider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: productProvider.fruitsProductList.map((product) {
                    return SingleProduct(
                      onTap: () {
                        Get.to(ProductOverview(
                          productImage: product.productImage,
                          productName: product.productName,
                          productPrices: product.productPrices,
                          productId: product.productId,
                        ));
                      },
                      productImage: product.productImage,
                      productName: product.productName,
                      productPrices: product.productPrices,
                      productId: product.productId,
                    );
                  }).toList(),
                ),
              ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    productProvider = Provider.of(context);

    UserProvider userProvider = Provider.of(context);
    userProvider.getUserData();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 213, 213),
      drawer: DrawerSide(userProvider: userProvider),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        title: const Text(
          "Home",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(SearchViewScreen(
                searchList: productProvider.getAllSearchProdut,
              ));
            },
            child: const CircleAvatar(
              child: Icon(Icons.search),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(ReviewCartView());
            },
            child: const CircleAvatar(
              child: Icon(Icons.shop),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // Refresh Button
          // IconButton(
          //   icon: const Icon(Icons.refresh),
          //   onPressed: _refreshScreen, // Refreshes the screen
          // ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _fetchProducts, // Pull-to-refresh implementation
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          child: ListView(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: AssetImage(
                        "assest/images/ve.png",
                      ),
                      fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 220,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 135, bottom: 0),
                            child: Container(
                              height: 45,
                              width: 100,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 217, 1),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(50),
                                  topLeft: Radius.circular(40),
                                  bottomRight: Radius.circular(60),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.only(left: 20, top: 4),
                                child: Text(
                                  "Vegi",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    shadows: [
                                      BoxShadow(
                                        blurRadius: 10,
                                        color: Color.fromARGB(255, 9, 66, 2),
                                        offset: Offset(4, 4),
                                      ),
                                      BoxShadow(
                                        blurRadius: 15,
                                        color: Color.fromARGB(255, 9, 66, 2),
                                        offset: Offset(-4, -3),
                                      ),
                                      BoxShadow(
                                        blurRadius: 20,
                                        color: Color.fromARGB(255, 9, 66, 2),
                                        offset: Offset(6, 6),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const off30Widgtes(),
                          const onalllvege(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              _buildFreshProduct(),
              _buildHerbProduct(context),
            ],
          ),
        ),
      ),
    );
  }
}
