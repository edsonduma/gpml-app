import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:stivy/views/agencies/agencies_list_screen.dart';
import 'package:stivy/views/designers/designers_list_screen.dart';
import 'package:stivy/views/makeup_artists/makeup_artists_list_screen.dart';
import 'package:stivy/views/models/models_list_screen.dart';
import 'package:stivy/views/photographers/photographers_list_screen.dart';
import 'package:stivy/views/stylists/stylists_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                        'Serviços Disponíveis',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Escolha os nossos serviços',
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
                            builder: (context) => const AgenciesListScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Modelos free',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ModelsListScreen(),
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
                                const PhotographersListScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Designers',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DesignersListScreen(),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Stylists',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const StylistsListScreen(),
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
                                const MakeupArtistsListScreen(),
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
