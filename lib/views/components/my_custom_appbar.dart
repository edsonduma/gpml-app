import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/login_screen.dart';

class MyCustomAppBar extends StatelessWidget {
  const MyCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          child: TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'voltar',
              style: TextStyle(
                color: secondColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(pageFrom: 'admin'),
              ),
            ),
            child: Text(
              'admin',
              style: TextStyle(
                color: secondColor,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
