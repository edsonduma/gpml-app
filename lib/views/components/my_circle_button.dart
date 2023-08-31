import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';

class MyCircleButton extends StatelessWidget {
  final String buttonLabel;
  final Widget nextScreen;

  const MyCircleButton({
    super.key,
    required this.buttonLabel,
    required this.nextScreen,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RawMaterialButton(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => nextScreen,
            ),
          ),
          elevation: 2.0,
          fillColor: secondColor,
          padding: const EdgeInsets.all(15.0),
          shape: const CircleBorder(),
          child: Text(
            buttonLabel[0],
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
        Text(
          buttonLabel,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
