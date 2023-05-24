import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gpml/utils/constants.dart';
import 'package:gpml/views/presentation_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  _SplashScreenState() {
    new Timer(const Duration(milliseconds: 2000), () {
      setState(() {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => PresentationScreen()),
          (route) => false,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Center(
          child: Text(
            'GMPL',
            style: TextStyle(
              color: secondColor,
              fontWeight: FontWeight.bold,
              fontSize: 100,
            ),
          ),
        ),
      ),
    );
  }
}
