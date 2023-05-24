import 'package:flutter/material.dart';

class MyCustomButtom extends StatelessWidget {
  MyCustomButtom({super.key, required this.labelName, required this.onPressed});

  final String labelName;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 8,
          right: 8,
        ),
        child: Text(
          labelName,
          style: TextStyle(
            color: Color(0xFFc712a2),
            fontSize: 20,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        side: const BorderSide(
          width: 2, // the thickness
          color: Color(0xFFe9a42c), // the color of the border
        ),
        fixedSize: Size(250, 45),
      ),
    );
  }
}
