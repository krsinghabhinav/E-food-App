import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demoteteee/View/screen/check_out/payment_summary/order_item.dart';
import 'package:demoteteee/models/deliveryAddressModel.dart';
import 'package:flutter/material.dart';

import '../delivery_details/single_delivery_item.dart';

enum AddressType { Home, Work, other }

class PymentSummary extends StatefulWidget {
  final DeliveryAddressModel? deliveryAddressList;
  const PymentSummary({super.key, this.deliveryAddressList});

  @override
  State<PymentSummary> createState() => _PymentSummaryState();
}

class _PymentSummaryState extends State<PymentSummary> {
  var mytype = AddressType.Home;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 247, 223, 10),
        title: Text(
          "Payment Details  ",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        child: ListTile(
          title: Text(
            'Total Amount',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            "\$5000",
            style: TextStyle(
                color: Colors.green, fontSize: 16, fontWeight: FontWeight.w600),
          ),
          trailing: Container(
              width: 160,
              child: MaterialButton(
                onPressed: () {},
                child: Text(
                  'Place Order',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                color: Color.fromARGB(255, 247, 223, 10),
              )),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                      'Area ${widget.deliveryAddressList!.area},Street ${widget.deliveryAddressList!.streem}, society${widget.deliveryAddressList!.society}, PinCode${widget.deliveryAddressList!.pincode}',
                  title:
                      '${widget.deliveryAddressList!.firstName} ${widget.deliveryAddressList!.lastName}',
                  addressType: "Home",
                  number: '+91-${widget.deliveryAddressList!.mobileNo}',
                ),
                // Divider(
                //   color: const Color.fromARGB(255, 87, 86, 86),
                // ),
                ExpansionTile(
                  children: [
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                    OrderItem(),
                  ],
                  title: Text("Order Item 8"),
                ),
                ListTile(
                  minVerticalPadding: 10,
                  leading: Text(
                    " Sub Total",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                  trailing: Text(
                    " \$200",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 10,
                  leading: Text(
                    " Shipping Charge",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey[500]),
                  ),
                  trailing: Text(
                    " \$0",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 10,
                  leading: Text(
                    " Coupan Discount",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey[500]),
                  ),
                  trailing: Text(
                    " \$10",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 10,
                  leading: Text(
                    " Shipping Charge",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                        color: Colors.grey[500]),
                  ),
                ),
                RadioListTile(
                  value: AddressType.Work,
                  groupValue: mytype,
                  title: Text('Case on Delivery'),
                  onChanged: (AddressType? value) {
                    setState(() {
                      mytype = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.cases_outlined,
                    color: Color.fromARGB(255, 247, 223, 10),
                    size: 35,
                  ),
                ),
                RadioListTile(
                  value: AddressType.other,
                  groupValue: mytype,
                  title: Text('Online Payment'),
                  onChanged: (AddressType? value) {
                    setState(() {
                      mytype = value!;
                    });
                  },
                  secondary: Icon(
                    Icons.online_prediction_sharp,
                    color: Color.fromARGB(255, 247, 223, 10),
                    size: 35,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
