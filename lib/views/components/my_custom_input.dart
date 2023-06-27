import 'package:stivy/utils/constants.dart';
import 'package:flutter/material.dart';

class MyCustomInput extends StatelessWidget {
  MyCustomInput({
    super.key,
    required this.labelName,
  });

  final String labelName;
  // final onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        hintText: labelName,
        hintStyle: TextStyle(color: secondColor),
      ),
      style: TextStyle(
        color: secondColor,
      ),
    );
  }
}
