import 'package:flutter/material.dart';

class SingleItem extends StatelessWidget {
  bool isBool;

  SingleItem({super.key, this.isBool = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          child: Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Center(
                    child: Image.asset(
                        "assest/images/f3.png"), // Ensure the path is correct
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool
                        ? MainAxisAlignment.spaceEvenly
                        : MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ProductName",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "\$50",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      isBool
                          ? Container(
                              height: 35,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(55, 221, 219, 219),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 187, 185, 185),
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                child: Row(
                                  children: [
                                    SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        "50 Gram",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(55, 0, 0, 0),
                                        ),
                                      ),
                                    ),
                                    Icon(Icons.arrow_drop_down),
                                  ],
                                ),
                              ),
                            )
                          : const Text("50 Gram"),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  padding: isBool
                      ? const EdgeInsets.symmetric(horizontal: 10, vertical: 30)
                      : const EdgeInsets.only(left: 0, top: 20),
                  child: isBool
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 0),
                              child: Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(55, 221, 219, 219),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 187, 185, 185),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 187, 185, 185),
                                    ),
                                    Text(
                                      "ADD",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 187, 185, 185),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Column(
                            children: [
                              const Icon(
                                Icons.delete,
                                size: 40,
                              ),
                              Container(
                                height: 30,
                                width: 80,
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(55, 221, 219, 219),
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 187, 185, 185),
                                  ),
                                ),
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add,
                                      color: Color.fromARGB(255, 187, 185, 185),
                                    ),
                                    Text(
                                      "ADD",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(255, 187, 185, 185),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ],
          ),
        ),
        isBool
            ? Container()
            : const Divider(
                height: 1,
                color: Colors.black,
              ),
      ],
    );
  }
}
