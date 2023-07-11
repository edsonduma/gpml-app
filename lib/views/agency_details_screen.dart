import 'package:stivy/views/agency_models_screen.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart';
import 'package:stivy/views/about_screen.dart';
import 'package:stivy/views/events_screen.dart';
import 'package:stivy/views/login_screen.dart';

class AgencyDetailsScreen extends StatelessWidget {
  const AgencyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AboutScreen(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondColor,
                      // side: const BorderSide(
                      //   width: 2, // the thickness
                      //   // color: Color(0xFFe9a42c), // the color of the border
                      //   color: Color(0xFFc712a2), // the color of the border
                      // ),
                    ),
                    child: Text(
                      'S',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'Sobre',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AgencyModelsScreen(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondColor,
                    ),
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'Agenciados',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EventsScreen(),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondColor,
                    ),
                    child: Text(
                      'E',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Text(
                    'Eventos',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
