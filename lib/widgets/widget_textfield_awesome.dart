import 'package:flutter/material.dart';

class MyOtherTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final bool isObscured;
  final ValueChanged<String>? onChanged;
  final Color maincolor;
  final Color fillcolor;

  const MyOtherTextField({
    super.key,
    required this.textEditingController,
    this.label = "calamity",
    this.isObscured = false,
    this.onChanged,
    this.maincolor = Colors.lightBlue,
    this.fillcolor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isObscured,
      controller: textEditingController,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: maincolor),
        filled: true,
        fillColor: fillcolor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: maincolor, width: 2),
        ),
      ),
    );
  }
}
