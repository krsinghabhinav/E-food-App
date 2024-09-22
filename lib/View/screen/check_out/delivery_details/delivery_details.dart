import 'package:demoteteee/View/screen/check_out/delivery_details/add_delivery_address/add_delivery_adderss.dart';
import 'package:demoteteee/View/screen/check_out/delivery_details/single_delivery_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeliveryDetailsView extends StatefulWidget {
  const DeliveryDetailsView({super.key});

  @override
  State<DeliveryDetailsView> createState() => _DeliveryDetailsViewState();
}

class _DeliveryDetailsViewState extends State<DeliveryDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 223, 10),
        title: Text(
          "Delivery Details",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 247, 223, 10),
        onPressed: () {
          // Add your action here
        },
        shape: CircleBorder(),
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 45,
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        height: 40,
        child: MaterialButton(
          onPressed: () {
            Get.to(AddDeliveryAdderss());
          },
          child: Center(
            child: Text(
              "Add New Address",
              style: TextStyle(fontSize: 20),
            ),
          ),
          color: Color.fromARGB(255, 247, 223, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(
              Icons.location_on,
              size: 40,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            title: Text(
              "Deliver To",
              style: TextStyle(fontSize: 22),
            ),
          ),
          const Divider(
            height: 1,
            color: Color.fromARGB(255, 0, 0, 0),
          ),
          Column(
            children: [
              SingleDeliveryItem(
                address: 'Area, Lucknow Kanchna bihari marge ',
                title: 'Abhinav Developer',
                addressType: "Home",
                number: '+91-7525827482',
              )
            ],
          ),
          Divider(
            height: 30,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
