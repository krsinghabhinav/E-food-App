import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Assuming you're using GetX for navigation
import '../homesWidgets/drawerScr.dart';

class MyProfileView extends StatefulWidget {
  final String userimage;
  final String username;
  final String userEmail;

  const MyProfileView(
      {super.key,
      required this.userimage,
      required this.username,
      required this.userEmail});

  @override
  State<MyProfileView> createState() => _MyProfileViewState();
}

class _MyProfileViewState extends State<MyProfileView> {
  Widget listTile({IconData? icon, String? titlename}) {
    return Column(
      children: [
        const Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(titlename!),
          trailing: const Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 208, 10),
      appBar: AppBar(
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: const Text(
          "My Profile",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
            fontSize: 25,
          ),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 90,
                color: const Color.fromARGB(255, 230, 208, 10),
              ),
              Container(
                height: 617,
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          width: 250,
                          padding: const EdgeInsets.only(left: 20, top: 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.username ?? 'Welcome Dost',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    widget.userEmail ??
                                        "exmaple@gmail.com", // Replace with dynamic email if needed
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  )
                                ],
                              ),
                              const CircleAvatar(
                                child: Icon(Icons.edit),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(
                      icon: Icons.shop_outlined,
                      titlename: "My Orders",
                    ),
                    listTile(
                      icon: Icons.location_on_outlined,
                      titlename: "My Delivery Address",
                    ),
                    listTile(
                      icon: Icons.person_outline,
                      titlename: "Refer a Friend",
                    ),
                    listTile(
                      icon: Icons.file_copy_outlined,
                      titlename: "Terms & Conditions",
                    ),
                    listTile(
                      icon: Icons.policy_outlined,
                      titlename: "Privacy Policy",
                    ),
                    listTile(
                      icon: Icons.add_card,
                      titlename: "About",
                    ),
                    listTile(
                      icon: Icons.exit_to_app_outlined,
                      titlename: "Log Out",
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 55, left: 25),
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Color.fromARGB(255, 230, 208, 10),
              child: CircleAvatar(
                radius: 45,
                backgroundImage: widget.userimage.isNotEmpty
                    ? NetworkImage(widget.userimage)
                    : const AssetImage('assets/images/per.png')
                        as ImageProvider,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
