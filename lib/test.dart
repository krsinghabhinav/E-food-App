import 'package:flutter/material.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 35),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 230, 208, 10),
        title: Text(
          "Search",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontSize: 25),
        ),
        actions: [
          Icon(Icons.menu_rounded),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 52,
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  fillColor: const Color.fromARGB(255, 221, 219, 219),
                  filled: true,
                  hintText: " Search for item in the store",
                  suffixIcon: Icon(Icons.search_outlined)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView(
              children: [
                Searchitem(),
                Searchitem(),
                Searchitem(),
                Searchitem(),
                Searchitem(),
                Searchitem(),
                Searchitem(),
                Searchitem(),
                Searchitem(),
                Searchitem(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Searchitem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("Item"),
    );
  }
}
