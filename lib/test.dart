// import 'package:flutter/material.dart';

// class SearchView extends StatefulWidget {
//   const SearchView({super.key});

//   @override
//   State<SearchView> createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0.0,
//         scrolledUnderElevation: 0.0,
//         iconTheme: const IconThemeData(color: Colors.black, size: 35),
//         centerTitle: true,
//         backgroundColor: const Color.fromARGB(255, 230, 208, 10),
//         title: const Text(
//           "Search",
//           style: TextStyle(
//               fontWeight: FontWeight.w700,
//               color: Color.fromARGB(255, 0, 0, 0),
//               fontSize: 25),
//         ),
//         actions: const [
//           Icon(Icons.menu_rounded),
//           SizedBox(
//             width: 20,
//           )
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             height: 52,
//             child: TextFormField(
//               decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   fillColor: const Color.fromARGB(255, 221, 219, 219),
//                   filled: true,
//                   hintText: " Search for item in the store",
//                   suffixIcon: const Icon(Icons.search_outlined)),
//             ),
//           ),
//           const SizedBox(
//             height: 10,
//           ),
//           Expanded(
//             child: ListView(
//               children: const [
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//                 Searchitem(),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class Searchitem extends StatelessWidget {
//   const Searchitem({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const ListTile(
//       title: Text("Item"),
//     );
//   }
// }




 // children:<Widget> [
                                                // ListTile(
                                                //   title: new Text('50 gram'),
                                                //   onTap: () {
                                                //     Get.back();
                                                //   },
                                                // ),
                                                // ListTile(
                                                //   title: new Text('500 gram'),
                                                //   onTap: () {
                                                //     Get.back();
                                                //   },
                                                // ),
                                                // ListTile(
                                                //   title: new Text('1 kg'),
                                                //   onTap: () {
                                                //     Get.back();
                                                //   },
                                                // ),
                                                // ListTile(
                                                //   title: new Text('2 kg'),
                                                //   onTap: () {
                                                //     Get.back();
                                                //   },
                                                // )
                                                // ],



                                                  // GestureDetector(
                                      //   onTap: () {
                                      // showModalBottomSheet(
                                      //   context: context,
                                      //   builder: (context) {
                                      //     return Column(
                                      //       mainAxisSize: MainAxisSize.min,
                                      //       children: [
                                      //         ListTile(
                                      //           title: new Text('50 gram'),
                                      //           onTap: () {
                                      //             Get.back();
                                      //           },
                                      //         ),
                                      //         ListTile(
                                      //           title: new Text('500 gram'),
                                      //           onTap: () {
                                      //             Get.back();
                                      //           },
                                      //         ),
                                      //         ListTile(
                                      //           title: new Text('1 kg'),
                                      //           onTap: () {
                                      //             Get.back();
                                      //           },
                                      //         ),
                                      //         ListTile(
                                      //           title: new Text('2 kg'),
                                      //           onTap: () {
                                      //             Get.back();
                                      //           },
                                      //         )
                                      //       ],
                                      //     );
                                      //   },
                                      // );
                                      //   },
                                      //   child: Container(
                                      //     decoration: BoxDecoration(
                                      //       border:
                                      //           Border.all(color: Colors.grey),
                                      //       borderRadius:
                                      //           BorderRadius.circular(10),
                                      //     ),
                                      //     height: 30,
                                      //     child: const Row(
                                      //       mainAxisAlignment:
                                      //           MainAxisAlignment.center,
                                      //       children: [
                                      //         Text("50Gram"),
                                      //         Icon(Icons.arrow_drop_down),
                                      //       ],
                                      //     ),
                                      //   ),
                                      // ),