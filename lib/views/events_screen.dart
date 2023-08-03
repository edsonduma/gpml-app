import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart.txt';
import 'package:stivy/views/login_screen.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

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
                    left: 120,
                    right: 120,
                    bottom: 30,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Eventos',
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
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    color: Colors.black,
                    width: 120,
                    height: 120,
                  ),
                ),
                Card(
                  child: Container(
                    color: Colors.black,
                    width: 120,
                    height: 120,
                  ),
                ),
                Card(
                  child: Container(
                    color: Colors.black,
                    width: 120,
                    height: 120,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Aniversário',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Hadja Models',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Data: 11/06/22',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Local: Lookal',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Horário: 22h',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 35),
                Column(
                  children: [
                    Text(
                      'Aniversário',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Hadja Models',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Data: 11/06/22',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Local: Lookal',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Horário: 22h',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 35),
                Column(
                  children: [
                    Text(
                      'Aniversário',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Hadja Models',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Data: 11/06/22',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Local: Lookal',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'Horário: 22h',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
