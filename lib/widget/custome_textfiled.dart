import 'package:flutter/material.dart';

class CustomeTextfiled extends StatefulWidget {
  final TextEditingController? controller;
  final String? labText;
  final TextInputType? keyboardtype;

  const CustomeTextfiled({
    Key? key,
    this.controller,
    this.labText,
    this.keyboardtype,
  }) : super(key: key);

  @override
  State<CustomeTextfiled> createState() => _CustomeTextfiledState();
}

class _CustomeTextfiledState extends State<CustomeTextfiled> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardtype ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: widget.labText ?? '',
        // border: const OutlineInputBorder(),
      ),
    );
  }
}
