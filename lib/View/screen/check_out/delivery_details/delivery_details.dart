import 'package:demoteteee/View/screen/check_out/delivery_details/add_delivery_address/add_delivery_adderss.dart';
import 'package:demoteteee/View/screen/check_out/delivery_details/single_delivery_item.dart';
import 'package:demoteteee/models/deliveryAddressModel.dart';
import 'package:demoteteee/providers/check_out_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../payment_summary/pyment_summary.dart';

class DeliveryDetailsView extends StatefulWidget {
  const DeliveryDetailsView({super.key});

  @override
  State<DeliveryDetailsView> createState() => _DeliveryDetailsViewState();
}

class _DeliveryDetailsViewState extends State<DeliveryDetailsView> {
  DeliveryAddressModel? value;

  @override
  Widget build(BuildContext context) {
    // if (value != null) {
    //   print(value!.firstName);
    // } else {
    //   print("Value is null");
    // }

    CheckOutProvider checkOutProvider = Provider.of(context);
    checkOutProvider.getDeliveryAddressData();

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
          Get.to(AddDeliveryAddress());
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
            checkOutProvider.getDatalstDeliveryAddress.isEmpty
                ? Get.to(AddDeliveryAddress())
                : Get.to(PymentSummary(
                    deliveryAddressList: value,
                  ));
          },
          child: Center(
            child: checkOutProvider.getDatalstDeliveryAddress.isEmpty
                ? Text(
                    "Add New Address",
                    style: TextStyle(fontSize: 20),
                  )
                : Text(
                    "Get Payment",
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
              checkOutProvider.getDatalstDeliveryAddress.isEmpty
                  ? Container(
                      child: Text("No Data"),
                    )
                  : Column(
                      children: checkOutProvider.getDatalstDeliveryAddress
                          .map((data) {
                        setState(() {
                          value = data;
                        });
                        return SingleDeliveryItem(
                          address:
                              'Area ${data.area},Street ${data.streem}, society${data.society}, PinCode${data.pincode}',
                          title: '${data.firstName} ${data.lastName}',
                          addressType: "Home",
                          number: '+91-${data.mobileNo}',
                        );
                      }).toList(),
                    ),
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
