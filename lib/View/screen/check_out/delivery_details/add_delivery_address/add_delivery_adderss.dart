import 'package:demoteteee/View/screen/check_out/google_map/google_map.dart';
import 'package:demoteteee/providers/check_out_provider.dart';
import 'package:demoteteee/widget/custome_textfiled.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

enum AddressType { Home, Work, Other }

class AddDeliveryAddress extends StatefulWidget {
  const AddDeliveryAddress({super.key});

  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressType.Home;

  @override
  Widget build(BuildContext context) {
    final checkOutProvider = Provider.of<CheckOutProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 247, 223, 10),
        title: const Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(vertical: 18, horizontal: 25),
        height: 48,
        child: checkOutProvider.isLoading
            ? const Center(child: CircularProgressIndicator())
            : MaterialButton(
                color: const Color.fromARGB(255, 247, 223, 10),
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  checkOutProvider.validator(context, myType);
                },
                child: const Text(
                  "Add Address",
                  style: TextStyle(fontSize: 18),
                ),
              ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            CustomeTextfiled(
              labText: "First Name",
              controller: checkOutProvider.firstName,
            ),
            CustomeTextfiled(
              labText: "Last Name",
              controller: checkOutProvider.lastName,
            ),
            CustomeTextfiled(
              labText: "Mobile No",
              controller: checkOutProvider.mobileNo,
            ),
            CustomeTextfiled(
              labText: "Alternative Mobile No",
              controller: checkOutProvider.altMobileNo,
            ),
            CustomeTextfiled(
              labText: "Society",
              controller: checkOutProvider.society,
            ),
            CustomeTextfiled(
              labText: "Street",
              controller: checkOutProvider.streem,
            ),
            CustomeTextfiled(
              labText: "Landmark",
              controller: checkOutProvider.landmark,
            ),
            CustomeTextfiled(
              labText: "City",
              controller: checkOutProvider.city,
            ),
            CustomeTextfiled(
              labText: "Area",
              controller: checkOutProvider.area,
            ),
            CustomeTextfiled(
              labText: "PinCode",
              controller: checkOutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                setState(() {});
                Get.to(const CustomGoogleMap());
              },
              child: SizedBox(
                width: double.infinity,
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Assuming checkb is a property of CheckOutProvider
                    checkOutProvider.setLocation == null
                        ? const Text(" Set  Location")
                        : const Text("done!!"),
                  ],
                ),
              ),
            ),
            const Divider(color: Colors.black),
            const ListTile(
              title: Text("Enter Address*"),
            ),
            // Radio Buttons for Address Type
            RadioListTile<AddressType>(
              value: AddressType.Home,
              groupValue: myType,
              title: const Text('Home'),
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(
                Icons.home,
                color: Color.fromARGB(255, 247, 223, 10),
                size: 35,
              ),
            ),
            RadioListTile<AddressType>(
              value: AddressType.Work,
              groupValue: myType,
              title: const Text('Work'),
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(
                Icons.work,
                color: Color.fromARGB(255, 247, 223, 10),
                size: 35,
              ),
            ),
            RadioListTile<AddressType>(
              value: AddressType.Other,
              groupValue: myType,
              title: const Text('Other'),
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: const Icon(
                Icons.devices_other,
                color: Color.fromARGB(255, 247, 223, 10),
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
