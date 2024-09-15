import 'package:flutter/material.dart';

class CountAddRemoveitem extends StatefulWidget {
  const CountAddRemoveitem({
    super.key,
  });

  @override
  State<CountAddRemoveitem> createState() => _CountAddRemoveitemState();
}

class _CountAddRemoveitemState extends State<CountAddRemoveitem> {
  int count = 1;
  bool isTrue = false;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 2),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 30,
        child: isTrue == true
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        if (count == 1) {
                          setState(() {
                            isTrue = false;
                          });
                        } else {
                          setState(() {
                            count--;
                          });
                        }
                      },
                      child: Icon(Icons.remove)),
                  SizedBox(width: 0),
                  Text(
                    ' $count',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 0),
                  InkWell(
                      onTap: () {
                        setState(() {
                          count++;
                        });
                      },
                      child: Icon(Icons.add)),
                ],
              )
            : Center(
                child: Container(
                  width: 50,
                  margin: EdgeInsets.all(5),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isTrue = true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text("ADD"),
                    ),
                  ),
                ),
              ));
  }
}
