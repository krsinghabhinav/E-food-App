import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class off30Widgtes extends StatefulWidget {
  const off30Widgtes({super.key});

  @override
  State<off30Widgtes> createState() => _off30WidgtesState();
}

class _off30WidgtesState extends State<off30Widgtes> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 50, top: 4),
      child: Text(
        "30%Off",
        style: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          shadows: [
            BoxShadow(
              blurRadius: 10,
              color: Color.fromARGB(255, 9, 66, 2),
              offset: Offset(4, 4), // You can adjust the offset for the shadow
            ),
            BoxShadow(
              blurRadius: 15,
              color: Color.fromARGB(255, 9, 66, 2),
              offset: Offset(-4, -3),
            ),
            BoxShadow(
              blurRadius: 20,
              color: Color.fromARGB(255, 9, 66, 2),
              offset: Offset(6, 6),
            ),
          ],
        ),
      ),
    );
  }
}
