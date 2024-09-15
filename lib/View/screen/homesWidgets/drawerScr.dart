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
      minVerticalPadding: 7,
      minTileHeight: 0,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        titleName!,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 75, 72, 72)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 221, 201, 18),
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50,
                  child: CircleAvatar(
                    radius: 48,
                    backgroundColor: Color.fromARGB(255, 238, 215, 12),
                    backgroundImage: AssetImage('assest/images/per.png'),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 7,
                    ),
                    const Text(
                      'Welcome Guest',
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    SizedBox(
                      height: 35,
                      child: OutlinedButton(
                          onPressed: () {},
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 18),
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
          widgetListTile(icon: Icons.home_outlined, titleName: "Home"),
          widgetListTile(
              icon: Icons.shop_outlined,
              titleName: "Review Cart",
              onTap: () {
                Get.to(const ReviewCartView(), arguments: {'name': 'abhinab'});
              }),
          widgetListTile(
              icon: Icons.person_outline,
              titleName: "My Profile",
              onTap: () {
                Get.to(const MyProfileView());
              }),
          widgetListTile(
              icon: Icons.notifications_outlined, titleName: "Notification"),
          widgetListTile(
              icon: Icons.star_outline, titleName: "Rating & Review"),
          widgetListTile(icon: Icons.favorite_outline, titleName: "Wishlist"),
          widgetListTile(
              icon: Icons.copy_outlined, titleName: "Raise a Complaint"),
          widgetListTile(icon: Icons.format_quote_outlined, titleName: "FAQs"),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Contact Support',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 75, 72, 72)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Call us:',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 75, 72, 72)),
                    ),
                    Text(
                      '+917525827482',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 75, 72, 72)),
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
                          color: Color.fromARGB(255, 75, 72, 72)),
                    ),
                    Text(
                      'abhinavsingh@gmail.com',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Color.fromARGB(255, 75, 72, 72)),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
