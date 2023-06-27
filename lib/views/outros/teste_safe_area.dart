import 'package:flutter/material.dart';

class TesteSafeArea extends StatelessWidget {
  const TesteSafeArea({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // child: SingleChildScrollView(
      child: Container(
        child: Center(
          child: Text(
            'Novo teste de area',
            style: TextStyle(fontSize: 50.0),
          ),
        ),
      ),
      // ),
    );
  }
}
