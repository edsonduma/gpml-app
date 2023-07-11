import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/menu_models_screen.dart';
import 'package:stivy/views/agency_details_screen.dart';
import 'package:stivy/views/agencies_list_screen.dart';
import 'package:stivy/views/agency_models_screen.dart';
import 'package:stivy/views/about_screen.dart';
import 'package:stivy/views/events_screen.dart';
import 'package:stivy/views/models_details_screen.dart';
import 'package:stivy/views/models_create_screen.dart';
import 'package:stivy/views/models_list_screen.dart';
import 'package:stivy/views/outros/teste_safe_area.dart';
import 'package:stivy/views/home_screen.dart';
import 'package:stivy/views/login_screen.dart';
import 'package:stivy/views/presentation_screen.dart';
import 'package:stivy/views/register_screen.dart';
import 'package:stivy/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        // primarySwatch: primaryColor,
        primaryColor: primaryColor,
      ),
      home: SplashScreen(),
      // home: PresentationScreen(),
      // home: LoginScreen(),
      // home: HomeScreen(),
      // home: RegisterScreen(),
      // home: MyTeste(),
      // home: ModelsScreen(),
      // home: AboutScreen(),
      // home: EventsScreen(),
      // home: ModelsDetailsScreen(),
      // home: ModelsListScreen(),
      // home: AgencyDetailsScreen(),
      // home: AgenciesListScreen(),
      // home: MenuScreen(),
      // home: MenuModelsScreen(),
    );
  }
}
