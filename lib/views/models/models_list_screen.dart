import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart.txt';
import 'package:stivy/views/login_screen.dart';
import 'package:stivy/views/models/models_details_screen.dart';

class ModelsListScreen extends StatelessWidget {
  const ModelsListScreen({super.key});

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
                    left: 50,
                    right: 50,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Modelos'.toUpperCase(),
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'TODOS'.toUpperCase(),
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 30),
                          Text(
                            'MULHERES'.toUpperCase(),
                            style: TextStyle(
                              color: secondColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 30),
                          Text(
                            'HOMENS'.toUpperCase(),
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(width: 20),
                        ],
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
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //   ],
                      // ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ElevatedButton(
                          //   child: Text('Pesquisa Avancada'),
                          //   onPressed: () {},
                          // ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                // left: 15,
                                // right: 15,
                              ),
                              child: Text(
                                'Pesquisa Avancada',
                                style: TextStyle(
                                  color: Color(0xFFc712a2),
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: thirdColor,
                              // side: const BorderSide(
                              //   width: 2, // the thickness
                              //   color: Color(0xFFe9a42c), // the color of the border
                              // ),
                              fixedSize: Size(250, 45),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 30),
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
                      builder: (context) => ModelsDetailsScreen(),
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
                      builder: (context) => ModelsDetailsScreen(),
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
                      builder: (context) => ModelsDetailsScreen(),
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
                      builder: (context) => ModelsDetailsScreen(),
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
                      builder: (context) => ModelsDetailsScreen(),
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
                      builder: (context) => ModelsDetailsScreen(),
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
