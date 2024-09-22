import 'package:demoteteee/View/screen/wishlist/wishList.dart';
import 'package:demoteteee/providers/userProvider.dart';

import '../my_profile/my_profile.dart';
import '../review_cart/review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerSide extends StatefulWidget {
  UserProvider? userProvider = UserProvider();
  DrawerSide({super.key, this.userProvider});

  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget widgetListTile({
    required IconData icon,
    required String titleName,
    VoidCallback? onTap,
  }) {
    return ListTile(
      minVerticalPadding: 7,
      minLeadingWidth: 0,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 30,
      ),
      title: Text(
        titleName,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(255, 75, 72, 72)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var userData = widget.userProvider?.currentData;
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 221, 201, 18),
      child: Column(
        children: [
          DrawerHeader(
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 46,
                  child: CircleAvatar(
                      radius: 44,
                      backgroundImage: userData?.userImage != null
                          ? NetworkImage(userData!.userImage)
                          : AssetImage("assest/images/per.png")),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 7),
                    Text(
                      userData != null ? userData.userName : 'Welcome Guest',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w500,
                          fontSize: 18),
                    ),
                    const SizedBox(height: 7),
                    SizedBox(
                      height: 35,
                      child: OutlinedButton(
                        onPressed: () {
                          if (userData == null) {
                            // Navigate to login page
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
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
                Get.to(const ReviewCartView(), arguments: {'name': 'abhinav'});
              }),
          widgetListTile(
              icon: Icons.person_outline,
              titleName: "My Profile",
              onTap: () {
                Get.to(MyProfileView(
                  userimage: userData!.userImage,
                  username: userData.userName,
                  userEmail: userData.userEmail,
                ));
              }),
          widgetListTile(
              icon: Icons.notifications_outlined, titleName: "Notification"),
          widgetListTile(
              icon: Icons.star_outline, titleName: "Rating & Review"),
          widgetListTile(
              icon: Icons.favorite_outline,
              titleName: "Wishlist",
              onTap: () {
                Get.to(WishlistScreen());
              }),
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
                  children: [
                    Text(
                      'Call us: ',
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
                  children: [
                    Text(
                      'Mail us: ',
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
