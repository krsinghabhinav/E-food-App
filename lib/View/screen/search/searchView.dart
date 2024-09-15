import 'package:demoteteee/models/productsModel.dart';
import 'package:demoteteee/widget/SingleItem.dart';
import 'package:flutter/material.dart';

enum SinginCharacter { lowToHeigh, highToLow, alphabetically }

class SearchViewScreen extends StatefulWidget {
  final List<ProductModel> searchList;

  SearchViewScreen({this.searchList = const []});

  @override
  State<SearchViewScreen> createState() => _SearchViewScreenState();
}

class _SearchViewScreenState extends State<SearchViewScreen> {
  String query = ''; // it is used for search item

//////   this code is used for which item you want to search
  searchItem(String query) {
    List<ProductModel> searchFood = widget.searchList.where((element) {
      return element.productName.toLowerCase().contains(query);
    }).toList();
    return searchFood;
  }

  @override
  Widget build(BuildContext context) {
    List<ProductModel> _searchItem = searchItem(query);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: const Text(
          "Search",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 25,
          ),
        ),
        actions: const [
          Icon(Icons.menu_rounded),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              "Items",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 52,
            child: TextFormField(
              onChanged: (Value) {
                print("data print----------------------- $Value");
                setState(() {
                  query = Value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                fillColor: const Color.fromARGB(255, 221, 219, 219),
                filled: true,
                hintText: "Search for item in the store",
                suffixIcon: const Icon(Icons.search_outlined),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Expanded(
            child: Column(
              children: _searchItem.map((data) {
                return SingleItem(
                  isBool: true,
                  productImage: data.productImage,
                  productName: data.productName,
                  productPrices: data.productPrices,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
