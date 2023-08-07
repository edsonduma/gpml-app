import 'dart:async';
import 'package:flutter/material.dart';
import 'package:stivy/models/user.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/utils/sqflite_helper.dart';
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
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async {
  // Avoid errors caused by flutter upgrade.
// Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  // final  database = openDatabase(
  //   // Set the path to the database. Note: Using the `join` function from the
  //   // `path` package is best practice to ensure the path is correctly
  //   // constructed for each platform.
  //   join(await getDatabasesPath(), 'stivy_database.db'),
  // );

  await SqfliteHelper.init();
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
