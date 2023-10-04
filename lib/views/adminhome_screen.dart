import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:stivy/views/agencies/menu_agencies_screen.dart';
import 'package:stivy/views/designers/menu_designers_screen.dart';
import 'package:stivy/views/makeup_artists/menu_makeup_artists_screen.dart';
import 'package:stivy/views/models/menu_models_screen.dart';
import 'package:stivy/views/photographers/menu_photographers_screen.dart';
import 'package:stivy/views/stylists/menu_stylists_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  // final Color mySecondColor = mySecondColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      // appBar: AppBar(
      //   backgroundColor: primaryColor,
      // ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            MyCustomAppBar(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                // color: Colors.white,
                // margin: EdgeInsets.all(30.0),
                // padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: const Color(0xFF707070), // #707070
                  ),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 40,
                    right: 40,
                    bottom: 150,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Menu Administrativo',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Cadastrar Dados',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 60),
                      MyCustomButtom(
                        labelName: 'Agências de Moda',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuAgenciesScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Modelos',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuModelsScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Fotógrafos',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MenuPhotographersScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Designers',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuDesignersScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Stylists',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuStylistsScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Makeup artists',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const MenuMakeupArtistsScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
