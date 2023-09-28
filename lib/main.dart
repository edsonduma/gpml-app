import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/utils/sqflite_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/utils/supabase_helper.dart';
import 'package:stivy/views/splash_screen.dart';
import 'package:stivy/views/models/menu_models_screen.dart';
import 'package:stivy/views/agencies/agency_details_screen.dart';
import 'package:stivy/views/agencies/agencies_list_screen.dart';
import 'package:stivy/views/agencies/agency_models_screen.dart';
import 'package:stivy/views/about_screen.dart';
import 'package:stivy/views/events_screen.dart';
import 'package:stivy/views/models/models_details_screen.dart';
import 'package:stivy/views/models/models_create_screen.dart';
import 'package:stivy/views/models/models_list_screen.dart';
import 'package:stivy/views/outros/teste_safe_area.dart';
import 'package:stivy/views/home_screen.dart';
import 'package:stivy/views/login_screen.dart';
import 'package:stivy/views/presentation_screen.dart';
import 'package:stivy/views/register_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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

  await GetStorage.init();
  // await SqfliteHelper.init();
  await SupabaseHelper.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SupaBaseHandler()),
    ],
    child: const MyApp(),
  ));
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
      home: const SplashScreen(),
      // home: const PresentationScreen(),
      // home: const LoginScreen(),
      // home: const HomeScreen(),
      // home: const RegisterScreen(),
      // home: const MyTeste(),
      // home: const ModelsScreen(),
      // home: const AboutScreen(),
      // home: const EventsScreen(),
      // home: const ModelsDetailsScreen(),
      // home: const ModelsListScreen(),
      // home: const AgencyDetailsScreen(),
      // home: const AgenciesListScreen(),
      // home: const MenuScreen(),
      // home: const MenuModelsScreen(),
    );
  }
}
