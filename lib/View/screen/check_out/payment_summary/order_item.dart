import 'package:flutter/material.dart';

class OrderItem extends StatefulWidget {
  const OrderItem({super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg',
        width: 70,
        height: 100,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Food Name",
            style: TextStyle(color: Colors.grey[700]),
          ),
          Text(
            "50 gram",
            style: TextStyle(color: Colors.grey[600]),
          ),
          Text(
            "\$100",
            style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),  
          ),
        ],
      ),
      subtitle:
          Text("5", style: TextStyle(color: Colors.grey[600], fontSize: 18)),
    );
  }
}
