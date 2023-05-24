import 'package:flutter/material.dart';
import 'package:gpml/utils/constants.dart';
import 'package:gpml/views/components/my_custom_buttons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<HomeScreen> {
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
            Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'voltar',
                  style: TextStyle(
                    color: secondColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
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
                        'Serviços Disponíveis',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Escolha os nossos serviços',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 60),
                      MyCustomButtom(
                        labelName: 'Agencia de Moda',
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Modelos free',
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Fotografos',
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Design',
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Stylist',
                        onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      MyCustomButtom(
                        labelName: 'Make up',
                        onPressed: () {},
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
