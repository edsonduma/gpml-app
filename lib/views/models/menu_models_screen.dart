import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:stivy/views/models/models_create_screen.dart';

class MenuModelsScreen extends StatefulWidget {
  const MenuModelsScreen({super.key});

  @override
  State<MenuModelsScreen> createState() => _MenuModelsScreenState();
}

class _MenuModelsScreenState extends State<MenuModelsScreen> {
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
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: TextButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     child: Text(
            //       'voltar',
            //       style: TextStyle(
            //         color: secondColor,
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),
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
                        'HADJA MODELS',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Hadja Models',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ModelsCreateScreen(),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            'Adicionar',
                            style: TextStyle(
                              color: Color(0xFFc712a2),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: thirdColor,
                          // side: const BorderSide(
                          //   width: 2, // the thickness
                          //   color: Color(0xFFe9a42c), // the color of the border
                          // ),
                          fixedSize: Size(200, 45),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            'Alterar',
                            style: TextStyle(
                              color: Color(0xFFc712a2),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: thirdColor,
                          // side: const BorderSide(
                          //   width: 2, // the thickness
                          //   color: Color(0xFFe9a42c), // the color of the border
                          // ),
                          fixedSize: Size(200, 45),
                        ),
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            'Apagar',
                            style: TextStyle(
                              color: Color(0xFFc712a2),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: thirdColor,
                          // side: const BorderSide(
                          //   width: 2, // the thickness
                          //   color: Color(0xFFe9a42c), // the color of the border
                          // ),
                          fixedSize: Size(200, 45),
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
