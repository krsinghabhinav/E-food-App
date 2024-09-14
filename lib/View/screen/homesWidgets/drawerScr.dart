import 'package:demoteteee/View/screen/my_profile/my_profile.dart';
import 'package:demoteteee/View/screen/review_cart/review.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerSide extends StatefulWidget {
  const DrawerSide({super.key});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget widgetListTile(
      {IconData? icon, String? titleName, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        titleName!,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: const Color.fromARGB(255, 75, 72, 72)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 221, 201, 18),
      child: Container(
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: CircleAvatar(
                      radius: 48,
                      backgroundColor: const Color.fromARGB(255, 238, 215, 12),
                      backgroundImage: AssetImage('assest/images/per.png'),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  // SizedBox(
                  //   height: 7,
                  // ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        'Welcome Guest',
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 35,
                        // width: 100,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  // color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18),
                            )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              width: 30,
            ),
            widgetListTile(icon: Icons.home_outlined, titleName: "Home"),
            widgetListTile(
                icon: Icons.shop_outlined,
                titleName: "Review Cart",
                onTap: () {
                  Get.to(ReviewCartView(), arguments: {'name': 'abhinab'});
                }),
            widgetListTile(
                icon: Icons.person_outline,
                titleName: "My Profile",
                onTap: () {
                  Get.to(MyProfileView());
                }),
            widgetListTile(
                icon: Icons.notifications_outlined, titleName: "Notification"),
            widgetListTile(
                icon: Icons.star_outline, titleName: "Rating & Review"),
            widgetListTile(icon: Icons.favorite_outline, titleName: "Wishlist"),
            widgetListTile(
                icon: Icons.copy_outlined, titleName: "Raise a Complant"),
            widgetListTile(
                icon: Icons.format_quote_outlined, titleName: "FAQs"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Support',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 75, 72, 72)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Call us:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 75, 72, 72)),
                      ),
                      Text(
                        '+917525827482',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 75, 72, 72)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Mail us:',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 75, 72, 72)),
                      ),
                      Text(
                        'abhinavsingh@gmail.com',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 75, 72, 72)),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
