import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/models/models_create_screen.dart';
import 'package:stivy/views/models/models_list_screen.dart';

class MenuModelsScreen extends StatefulWidget {
  const MenuModelsScreen({super.key});

  @override
  State<MenuModelsScreen> createState() => _MenuModelsScreenState();
}

class _MenuModelsScreenState extends State<MenuModelsScreen> {
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
                        'MODELOS',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'MODELOS',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 60),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ModelsCreateScreen(),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            'Adicionar',
                            style: TextStyle(
                              color: mySecondColor,
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
                          fixedSize: const Size(200, 45),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ModelsListScreen(),
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            'Listar',
                            style: TextStyle(
                              color: mySecondColor,
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
                          fixedSize: const Size(200, 45),
                        ),
                      ),
                      // const SizedBox(height: 20),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Padding(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //       bottom: 10,
                      //       left: 8,
                      //       right: 8,
                      //     ),
                      //     child: Text(
                      //       'Alterar',
                      //       style: TextStyle(
                      //         color: mySecondColor,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: thirdColor,
                      //     // side: const BorderSide(
                      //     //   width: 2, // the thickness
                      //     //   color: Color(0xFFe9a42c), // the color of the border
                      //     // ),
                      //     fixedSize: const Size(200, 45),
                      //   ),
                      // ),
                      // const SizedBox(height: 20),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Padding(
                      //     padding: EdgeInsets.only(
                      //       top: 10,
                      //       bottom: 10,
                      //       left: 8,
                      //       right: 8,
                      //     ),
                      //     child: Text(
                      //       'Apagar',
                      //       style: TextStyle(
                      //         color: mySecondColor,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ),
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: thirdColor,
                      //     // side: const BorderSide(
                      //     //   width: 2, // the thickness
                      //     //   color: Color(0xFFe9a42c), // the color of the border
                      //     // ),
                      //     fixedSize: const Size(200, 45),
                      //   ),
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
