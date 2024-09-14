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
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(titlename!),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 208, 10),

      // backgroundColor: const Color.fromARGB(255, 230, 208, 10),
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: Text(
          "My Profile",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 25),
        ),
      ),
      drawer: DrawerSide(),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 90,
                color: Color.fromARGB(255, 230, 208, 10),
              ),
              Container(
                height: 617,
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
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
                          padding: EdgeInsets.only(left: 30, top: 0),
                          child: Row(
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
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16),
                                  ),
                                  Text(
                                    "abhinavsingh@gmail.com",
                                    style: TextStyle(
                                        // fontWeight: FontWeight.w500,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
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
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 30),
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
