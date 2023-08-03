import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/utils/sqflite_helper.dart';
import 'package:stivy/views/home_screen.dart';
import 'package:stivy/views/agency_details_screen.dart';
import 'package:stivy/views/menu_models_screen.dart';

class LoginScreen extends StatefulWidget {
  final String pageFrom;

  // const LoginScreen({super.key});
  const LoginScreen({Key? key, required this.pageFrom}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // final Color mySecondColor = Color(0xFFc712a2);
  TextEditingController? _emailController, _passwordController;

  @override
  initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
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
            Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'voltar',
                  style: TextStyle(color: secondColor, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.all(50),
              child: Column(
                children: [
                  Text(
                    'stivy',
                    style: TextStyle(
                      color: secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 80,
                    ),
                  ),
                  SizedBox(height: 70),
                  TextField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.red),
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFc712a2),
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFc712a2),
                          width: 2,
                        ),
                      ),
                      labelText: 'Email',
                      // fillColor: Color(0xFFe9a42c),
                      // fillColor: Color(0xFFc712a2),
                      labelStyle: TextStyle(
                        color: Color(0xFFc712a2),
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Digite nome de utilizador',
                      hintStyle: TextStyle(
                        color: Color(0xFFc712a2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextStyle(
                      color: secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      // border: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: Colors.red),
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFc712a2),
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0xFFc712a2),
                          width: 2,
                        ),
                      ),
                      labelText: 'Senha',
                      // fillColor: Color(0xFFe9a42c),
                      // fillColor: Color(0xFFc712a2),
                      labelStyle: TextStyle(
                        color: Color(0xFFc712a2),
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Digite senha do utilizador',
                      hintStyle: TextStyle(
                        color: Color(0xFFc712a2),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: TextStyle(
                      color: secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 70),
                  ElevatedButton(
                    onPressed: () async {
                      if (_emailController!.text.isNotEmpty) {
                        if (_passwordController!.text.isNotEmpty) {
                          bool loginStatus = await SqfliteHelper.login(
                            _emailController!.text,
                            _passwordController!.text,
                          );

                          if (loginStatus) {
                            switch (widget.pageFrom) {
                              case 'admin':
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const MenuModelsScreen(),
                                  ),
                                );
                              case 'requesting':
                                Navigator.of(context).pop();
                            }
                          }
                        }
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 12,
                        bottom: 12,
                        left: 45,
                        right: 45,
                      ),
                      child: Text(
                        'Entrar',
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        width: 2, // the thickness
                        // color: Color(0xFFe9a42c), // the color of the border
                        color: Color(0xFFc712a2), // the color of the border
                      ),
                    ),
                    /* ... */
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Recuperar senha',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(secondColor),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
