import 'package:flutter/material.dart';
import 'package:demoteteee/View/screen/homesWidgets/drawerScr.dart';

class MyProfileView extends StatefulWidget {
  const MyProfileView({super.key});

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

      // backgroundColor: const Color.fromARGB(255, 230, 208, 10),
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: const Text(
          "My Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 25),
        ),
      ),
      drawer: const DrawerSide(),
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
                  color: Color.fromARGB(255, 255, 255, 255),
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
                          padding: const EdgeInsets.only(left: 30, top: 0),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Abhinav kuamr Singh",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "abhinavsingh@gmail.com",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.w500,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 14),
                                  )
                                ],
                              ),
                              CircleAvatar(
                                child: Icon(Icons.edit),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    listTile(
                      icon: Icons.shop_outlined,
                      titlename: "My Oders",
                    ),
                    listTile(
                      icon: Icons.location_on_outlined,
                      titlename: "My Delivery Address",
                    ),
                    listTile(
                      icon: Icons.person_outline,
                      titlename: "Refer a friend",
                    ),
                    listTile(
                      icon: Icons.file_copy_outlined,
                      titlename: "Terms & Condition",
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
                      titlename: "LogOut",
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 40, left: 30),
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('assest/images/per.png'),
            ),
          )
        ],
      ),
    );
  }
}
