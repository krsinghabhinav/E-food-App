import 'package:flutter/material.dart';

class SingleDeliveryItem extends StatefulWidget {
  final String title;
  final String address;
  final String number;
  final String addressType; // Fixed typo from `addresType` to `addressType`

  SingleDeliveryItem({
    super.key,
    this.title = '',
    this.address = '',
    this.number = '',
    this.addressType = '', // Fixed typo
  });

  @override
  State<SingleDeliveryItem> createState() => _SingleDeliveryItemState();
}

class _SingleDeliveryItemState extends State<SingleDeliveryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 5.0, horizontal: 8), // Added padding for better spacing
          child: ListTile(
            leading: CircleAvatar(
              radius: 12,
              backgroundColor: Colors.yellow,
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title.isNotEmpty
                      ? widget.title
                      : 'No item', // Updated condition
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold), // Style for the title
                  overflow: TextOverflow.ellipsis, // Prevent overflow
                ),
                Container(
                  width: 70,
                  height: 30,

                  // Adjusted padding for better appearance
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 7, 255, 234),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      widget.addressType.isNotEmpty
                          ? widget.addressType
                          : "Office", // Updated to use the address type
                      style: TextStyle(
                          fontSize: 18,
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.address),
                Text(widget.number),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
