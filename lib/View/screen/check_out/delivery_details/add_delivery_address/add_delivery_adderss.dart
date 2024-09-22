import 'package:demoteteee/widget/custome_textfiled.dart';
import 'package:flutter/material.dart';

enum AddressType { Home, Work, other }

class AddDeliveryAdderss extends StatefulWidget {
  const AddDeliveryAdderss({super.key});

  @override
  State<AddDeliveryAdderss> createState() => _AddDeliveryAdderssState();
}

class _AddDeliveryAdderssState extends State<AddDeliveryAdderss> {
  var myType = AddressType.Home;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 223, 10),
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 18, horizontal: 25),
        height: 48,
        child: MaterialButton(
          color: Color.fromARGB(255, 247, 223, 10),
          shape:
              BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
          onPressed: () {},
          child: Text(
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
            ),
            CustomeTextfiled(
              labText: "Last Name",
            ),
            CustomeTextfiled(
              labText: "Mobile No",
            ),
            CustomeTextfiled(
              labText: "Alternetive Mobile No",
            ),
            CustomeTextfiled(
              labText: "Society",
            ),
            CustomeTextfiled(
              labText: "Streem",
            ),
            CustomeTextfiled(
              labText: "Landmark",
            ),
            CustomeTextfiled(
              labText: "City",
            ),
            CustomeTextfiled(
              labText: "Area",
            ),
            CustomeTextfiled(
              labText: "PinCode",
            ),
            CustomeTextfiled(
              labText: "Area",
            ),
            CustomeTextfiled(
              labText: "Area",
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 47,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Select Location")],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Enter Address*"),
            ),
            RadioListTile(
              value: AddressType.Home,
              groupValue: myType,
              title: Text('Home'),
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: Color.fromARGB(
                  255,
                  247,
                  223,
                  10,
                ),
                size: 35,
              ),
            ),
            RadioListTile(
              value: AddressType.Work,
              groupValue: myType,
              title: Text('Work'),
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: Color.fromARGB(255, 247, 223, 10),
                size: 35,
              ),
            ),
            RadioListTile(
              value: AddressType.other,
              groupValue: myType,
              title: Text('Other'),
              onChanged: (AddressType? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: Color.fromARGB(255, 247, 223, 10),
                size: 35,
              ),
            )
          ],
        ),
      ),
    );
  }
}
