import 'package:flutter/material.dart';
import 'package:gpml/utils/constants.dart';
import 'package:gpml/views/home_screen.dart';
import 'package:gpml/views/login_screen.dart';
import 'package:gpml/views/presentation_screen.dart';
import 'package:gpml/views/register_screen.dart';
import 'package:gpml/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GPML app',
      theme: ThemeData(
        // primarySwatch: primaryColor,
        primaryColor: primaryColor,
      ),
      home: SplashScreen(),
      // home: PresentationScreen(),
      // home: LoginScreen(),
      // home: HomeScreen(),
      // home: RegisterScreen(),
    );
  }
}
