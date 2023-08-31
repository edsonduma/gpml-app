import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/agencies/agency_models_screen.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:stivy/views/agencies/agencies_list_screen.dart';
import 'package:stivy/views/login_screen.dart';
import 'package:stivy/views/agencies/menu_agencies_screen.dart';
import 'package:stivy/views/models/menu_models_screen.dart';
import 'package:stivy/views/models/models_list_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({super.key});

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  // final Color mySecondColor = Color(0xFFc712a2);

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
            SizedBox(height: 30),
            MyCustomAppBar(),
            SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.only(top: 10),
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
                      SizedBox(height: 10),
                      Text(
                        'Cadastrar Dados',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 60),
                      MyCustomButtom(
                        labelName: 'Agencia de Moda',
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            // builder: (context) => AgenciesListScreen(),
                            builder: (context) => MenuAgenciesScreen(),
                          ),
                        ),
                      ),
                      // SizedBox(height: 20),
                      // MyCustomButtom(
                      //   labelName: 'Modelos free',
                      //   onPressed: () => Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => ModelsListScreen(),
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(height: 20),
                      // MyCustomButtom(
                      //   labelName: 'Fotografos',
                      //   onPressed: () {},
                      // ),
                      // SizedBox(height: 20),
                      // MyCustomButtom(
                      //   labelName: 'Design',
                      //   onPressed: () {},
                      // ),
                      // SizedBox(height: 20),
                      // MyCustomButtom(
                      //   labelName: 'Stylist',
                      //   onPressed: () {},
                      // ),
                      // SizedBox(height: 20),
                      // MyCustomButtom(
                      //   labelName: 'Make up',
                      //   onPressed: () {},
                      // ),
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
