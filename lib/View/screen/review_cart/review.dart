import 'package:demoteteee/widget/SingleItem.dart';
import 'package:flutter/material.dart';

class ReviewCartView extends StatefulWidget {
  const ReviewCartView({super.key});

  @override
  State<ReviewCartView> createState() => _ReviewCartViewState();
}

class _ReviewCartViewState extends State<ReviewCartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: const Text(
          "Total Amount",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 18,
          ),
        ),
        subtitle: const Text(
          "\$1500.00 ",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 29, 221, 39),
            fontSize: 16,
          ),
        ),
        trailing: Container(
          height: 50,
          width: 140,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 230, 6),
              borderRadius: BorderRadius.circular(30)),
          child: const Center(
            child: Text(
              "Submit",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 83, 81, 81),
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: const Text(
          "Review Cart",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          SingleItem(
            isBool: false,
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
