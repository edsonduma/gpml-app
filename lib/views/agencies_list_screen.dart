import 'package:stivy/views/about_screen.dart';
import 'package:stivy/views/agency_models_screen.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart.txt';
import 'package:stivy/views/agency_details_screen.dart';
import 'package:stivy/views/login_screen.dart';

class AgenciesListScreen extends StatelessWidget {
  const AgenciesListScreen({super.key});

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
                    left: 50,
                    right: 50,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'As melhores agencias da cidade capital você encontra aqui!',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          // border: const OutlineInputBorder(),
                          hintText: 'Pesquisar',
                          // hintStyle: TextStyle(color: secondColor),
                          hintStyle: TextStyle(color: thirdColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.black,
                          width: 120,
                          height: 150,
                        ),
                      ),
                      Text(
                        'Cael Pascoal',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgencyDetailsScreen(),
                    ),
                  ),
                ),
                InkWell(
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.black,
                          width: 120,
                          height: 150,
                        ),
                      ),
                      Text(
                        'Emma Diogo',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgencyDetailsScreen(),
                    ),
                  ),
                ),
                InkWell(
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.black,
                          width: 120,
                          height: 150,
                        ),
                      ),
                      Text(
                        'Nádia Campos',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgencyDetailsScreen(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.black,
                          width: 120,
                          height: 150,
                        ),
                      ),
                      Text(
                        'Stélvia Firmino',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgencyDetailsScreen(),
                    ),
                  ),
                ),
                InkWell(
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.black,
                          width: 120,
                          height: 150,
                        ),
                      ),
                      Text(
                        'Stélvia Firmino',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgencyDetailsScreen(),
                    ),
                  ),
                ),
                InkWell(
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.black,
                          width: 120,
                          height: 150,
                        ),
                      ),
                      Text(
                        'Stélvia Firmino',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AgencyDetailsScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
