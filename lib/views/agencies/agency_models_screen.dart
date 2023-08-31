import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart.txt';
import 'package:stivy/views/login_screen.dart';

class AgencyModelsScreen extends StatelessWidget {
  const AgencyModelsScreen({super.key});

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
            SizedBox(height: 10),
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
                    top: 5,
                    left: 120,
                    right: 120,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Card(
                        child: Container(
                          color: Colors.white,
                          height: 150,
                          width: 200,
                          //   decoration: BoxDecoration(
                          //       border: Border.all(color: Colors.black)),
                          child: Text('HADJA MODELS'),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Column(children: [
              Row(children: [
                SizedBox(width: 20),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'MODELOS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'CRIANÇAS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ACTORES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ACTORES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ACTORES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'COMERCIAL',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ACTORES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ACTORES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 25),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'PLUZ SIZE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ESPECIAIS',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ACTORES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'ACTORES',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ]),
            ]),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
