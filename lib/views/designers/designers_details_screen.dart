import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/login_screen.dart';
import 'package:stivy/views/models/abstract_screen_model.dart';

class DesignersDetailsScreen extends AbstractScreenModel {
  var dataModel;

  DesignersDetailsScreen({super.key});
  DesignersDetailsScreen.setModel({super.key, required this.dataModel});

  @override
  set setModel(dataModel) {
    this.dataModel = dataModel;
  }

  @override
  setModel2(dataModel) {
    this.dataModel = dataModel;
  }

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
                          color: Colors.black,
                          width: 160,
                          height: 160,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        // 'CAEL PASCOAL'.toUpperCase(),
                        dataModel["nome"].toUpperCase(),
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Informação',
              style: TextStyle(
                color: secondColor,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 35),
            Column(
              children: [
                Text(
                  // 'Altura: 178cm',
                  'Altura: ${dataModel["altura"]}cm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Peito/Busto: ${dataModel["peito"]}cm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Cintura: ${dataModel["cintura"]}cm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Anca: ${dataModel["anca"]}cm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Sapato: ${dataModel["sapato"]}cm',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Trabalhos',
              style: TextStyle(
                color: secondColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Container(
                    color: Colors.white,
                    width: 80,
                    height: 80,
                  ),
                ),
                Card(
                  child: Container(
                    color: Colors.white,
                    width: 80,
                    height: 80,
                  ),
                ),
                Card(
                  child: Container(
                    color: Colors.white,
                    width: 80,
                    height: 80,
                  ),
                ),
                Card(
                  child: Container(
                    color: Colors.white,
                    width: 80,
                    height: 80,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  // builder: (context) => LoginScreen(pageFrom: 'requesting'),
                  builder: (context) => LoginScreen(),
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
                  'Requisitar',
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
                fixedSize: Size(150, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
