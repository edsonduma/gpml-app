import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/presentation_screen.dart';

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'stivy'.toUpperCase(),
                style: TextStyle(
                  color: secondColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 100,
                  fontFamily: 'Clarendon FS',
                ),
              ),
              const SizedBox(
                height: 4,
                width: 100,
                child: LinearProgressIndicator(
                  color: mySecondColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
