import 'package:demoteteee/View/screen/homesWidgets/30%25off.dart';
import 'package:demoteteee/View/screen/product_overview/product_overview.dart';
import 'package:demoteteee/View/screen/search/searchView.dart';
import 'package:demoteteee/providers/provider_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
  Widget _buildHerbProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Herb Seasonings",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18),
              ),
              Text(
                "View All",
                style: TextStyle(
                    color: const Color.fromARGB(255, 102, 100, 100),
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ), // Added color to indicate it's clickable
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProduct(
                onTap: () {
                  Get.to(ProductOverview(
                    productImage: "assest/images/lifs1.png",
                    productName: "Fresh Basil",
                  ));
                },
                productImage: "assest/images/lifs1.png",
                productName: "Fresh Basil",
              ),
              SingleProduct(
                onTap: () {
                  Get.to(ProductOverview(
                    productImage: "assest/images/lifs2.png",
                    productName: "Fresh Mint",
                  ));
                },
                productImage: "assest/images/lifs2.png",
                productName: "Fresh Mint",
              ),
              SingleProduct(
                onTap: () {
                  Get.to(ProductOverview(
                    productImage: "assest/images/lifs3.png",
                    productName: "Fresh Tulsi",
                  ));
                },
                productImage: "assest/images/lifs3.png",
                productName: "Fresh Basil",
              ),
              SingleProduct(
                onTap: () {
                  Get.to(ProductOverview(
                    productImage: "assest/images/mery.png",
                    productName: "Fresh Tulsi",
                  ));
                },
                productImage: "assest/images/mery.png",
                productName: "Fresh Basil",
              ),
              SingleProduct(
                onTap: () {},
                productImage: "assest/images/lifs1.png",
                productName: "Fresh Basil",
              ),
            ],
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
          padding: const EdgeInsets.all(8.0),
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
              Text(
                "View All",
                style: TextStyle(
                    color: const Color.fromARGB(255, 102, 100, 100),
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ), // Added color to indicate it's clickable
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProduct(
                onTap: () {
                  Get.to(ProductOverview(
                    productImage: "assest/images/fruite.png",
                    productName: "Collection of Fruits",
                  ));
                },
                productImage: "assest/images/fruite.png",
                productName: "Collection of Fruits",
              ),
              SingleProduct(
                onTap: () {
                  print("kkkkkkkkkkkkkkkk");
                },
                productImage: "assest/images/f3.png",
                productName: "Fresh Basil",
              ),
              SingleProduct(
                onTap: () {},
                productImage: "assest/images/f2.png",
                productName: "Fresh Basil",
              ),
              SingleProduct(
                onTap: () {},
                productImage: "assest/images/f1.png",
                productName: "Fresh Basil",
              ),
            ],
          ),
        ),
      ],
    );
  }

  // @override
  // void initState() {
  //   ProductProvider productProvider = Provider.of(context, listen: false);
  //   productProvider.fetchHerbsProduction();
  //   super.initState();
  // }

  // Widget widgetListTile({required IconData icon, required String titleName}) {
  //   return ListTile(
  //     leading: Icon(
  //       icon,
  //       size: 30,
  //     ),
  //     title: Text(
  //       titleName,
  //       style: TextStyle(
  //           fontSize: 18,
  //           fontWeight: FontWeight.w400,
  //           color: const Color.fromARGB(255, 75, 72, 72)),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context, listen: false);
    productProvider.fetchHerbsProduction();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 214, 213, 213),
      drawer: DrawerSide(),
      // drawer: Drawer(
      //   backgroundColor: const Color.fromARGB(255, 221, 201, 18),
      //   child: Container(
      //     child: ListView(
      //       children: [
      //         DrawerHeader(
      //           child: Row(
      //             children: [
      //               CircleAvatar(
      //                 backgroundColor: Colors.white,
      //                 radius: 50,
      //                 child: CircleAvatar(
      //                   radius: 48,
      //                   backgroundColor:
      //                       const Color.fromARGB(255, 238, 215, 12),
      //                   backgroundImage: AssetImage('assest/images/per.png'),
      //                 ),
      //               ),
      //               SizedBox(
      //                 width: 15,
      //               ),
      //               // SizedBox(
      //               //   height: 7,
      //               // ),
      //               Column(
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: [
      //                   SizedBox(
      //                     height: 7,
      //                   ),
      //                   Text(
      //                     'Welcome Guest',
      //                     style: TextStyle(
      //                         color: const Color.fromARGB(255, 0, 0, 0),
      //                         fontWeight: FontWeight.w500,
      //                         fontSize: 20),
      //                   ),
      //                   SizedBox(
      //                     height: 7,
      //                   ),
      //                   Container(
      //                     height: 35,
      //                     // width: 100,
      //                     child: OutlinedButton(
      //                         onPressed: () {},
      //                         child: Text(
      //                           "Login",
      //                           style: TextStyle(
      //                               // color: const Color.fromARGB(255, 0, 0, 0),
      //                               fontWeight: FontWeight.w500,
      //                               fontSize: 18),
      //                         )),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //         SizedBox(
      //           width: 30,
      //         ),
      //         widgetListTile(icon: Icons.home_outlined, titleName: "Home"),
      //         widgetListTile(
      //             icon: Icons.shop_outlined, titleName: "Review Cart"),
      //         widgetListTile(
      //             icon: Icons.person_outline, titleName: "My Profile"),
      //         widgetListTile(
      //             icon: Icons.notifications_outlined,
      //             titleName: "Notification"),
      //         widgetListTile(
      //             icon: Icons.star_outline, titleName: "Rating & Review"),
      //         widgetListTile(
      //             icon: Icons.favorite_outline, titleName: "Wishlist"),
      //         widgetListTile(
      //             icon: Icons.copy_outlined, titleName: "Raise a Complant"),
      //         widgetListTile(
      //             icon: Icons.format_quote_outlined, titleName: "FAQs"),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 20),
      //           child: Column(
      //             // mainAxisAlignment: MainAxisAlignment.start,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(
      //                 'Contact Support',
      //                 style: TextStyle(
      //                     fontSize: 18,
      //                     fontWeight: FontWeight.w400,
      //                     color: const Color.fromARGB(255, 75, 72, 72)),
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Call us:',
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w400,
      //                         color: const Color.fromARGB(255, 75, 72, 72)),
      //                   ),
      //                   Text(
      //                     '+917525827482',
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w400,
      //                         color: const Color.fromARGB(255, 75, 72, 72)),
      //                   ),
      //                 ],
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     'Mail us:',
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w400,
      //                         color: const Color.fromARGB(255, 75, 72, 72)),
      //                   ),
      //                   Text(
      //                     'abhinavsingh@gmail.com',
      //                     style: TextStyle(
      //                         fontSize: 16,
      //                         fontWeight: FontWeight.w400,
      //                         color: const Color.fromARGB(255, 75, 72, 72)),
      //                   ),
      //                 ],
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        title: Text(
          "Home",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(SearchView());
            },
            child: CircleAvatar(
              child: Icon(Icons.search),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          CircleAvatar(
            child: Icon(Icons.shop),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: ListView(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assest/images/ve.png",
                    ),
                    fit: BoxFit.cover),

                borderRadius: BorderRadius.circular(20),

                // color: Colors.amber,
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
                          padding: const EdgeInsets.only(right: 135, bottom: 0),
                          child: Container(
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 217, 1),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(50),
                                topLeft: Radius.circular(40),
                                bottomRight: Radius.circular(60),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20, top: 4),
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
                                      offset: Offset(4,
                                          4), // You can adjust the offset for the shadow
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
                        off30Widgtes(),
                        onalllvege(),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Herb Seasonings",
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.w600,
            //             fontSize: 18),
            //       ),
            //       Text(
            //         "View All",
            //         style: TextStyle(
            //             color: const Color.fromARGB(255, 102, 100, 100),
            //             fontWeight: FontWeight.w500,
            //             fontSize: 18),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 5,
            //   ),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         // SingleProduct(),
            //         // SingleProduct(),
            //         // SingleProduct(),
            //         // SingleProduct(),
            //         _buildFreshProduct()
            //       ],
            //     ),
            //   ),
            // ),
            _buildHerbProduct(context),
            _buildFreshProduct(),

            // Padding(
            //   padding: const EdgeInsets.only(top: 10),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         "Fresh Fruits",
            //         style: TextStyle(
            //             color: Colors.black,
            //             fontWeight: FontWeight.w600,
            //             fontSize: 18),
            //       ),
            //       Text(
            //         "View All",
            //         style: TextStyle(
            //             color: const Color.fromARGB(255, 102, 100, 100),
            //             fontWeight: FontWeight.w500,
            //             fontSize: 18),
            //       ),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.only(
            //     top: 5,
            //   ),
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         FreshFruitesWidget(),
            //         FreshFruitesWidget(),
            //         FreshFruitesWidget(),
            //         FreshFruitesWidget(),
            //         FreshFruitesWidget(),
            //       ],
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
