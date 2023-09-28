import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/utils/sqflite_helper.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/utils/supabase_helper.dart';
import 'package:stivy/views/adminhome_screen.dart';
import 'package:stivy/views/home_screen.dart';
import 'package:stivy/views/agencies/agency_details_screen.dart';
import 'package:stivy/views/models/menu_models_screen.dart';

class LoginScreen extends StatefulWidget {
  final String pageFrom;

  // const LoginScreen({super.key});
  const LoginScreen({Key? key, required this.pageFrom}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late SupaBaseHandler supaBaseHandler = SupaBaseHandler();
  // final Color mySecondColor = mySecondColor;
  TextEditingController? _emailController, _passwordController;
  bool passenable = true; //boolean value to track password view enable disable.

  @override
  initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController!.dispose();
    _passwordController!.dispose();
    super.dispose();
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
                          color: mySecondColor,
                          width: 2,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: mySecondColor,
                          width: 2,
                        ),
                      ),
                      labelText: 'Email',
                      // fillColor: Color(0xFFe9a42c),
                      // fillColor: mySecondColor,
                      labelStyle: TextStyle(
                        color: mySecondColor,
                        fontWeight: FontWeight.bold,
                      ),
                      hintText: 'Digite seu email',
                      hintStyle: TextStyle(
                        color: mySecondColor,
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
                    obscureText: passenable,
                    decoration: InputDecoration(
                        // border: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.red),
                        // ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mySecondColor,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: mySecondColor,
                            width: 2,
                          ),
                        ),
                        labelText: 'Senha',
                        // fillColor: Color(0xFFe9a42c),
                        // fillColor: mySecondColor,
                        labelStyle: TextStyle(
                          color: mySecondColor,
                          fontWeight: FontWeight.bold,
                        ),
                        hintText: 'Digite sua senha',
                        hintStyle: TextStyle(
                          color: mySecondColor,
                          fontWeight: FontWeight.bold,
                        ),
                        suffix: IconButton(
                            color: secondColor,
                            onPressed: () {
                              //add Icon button at end of TextField
                              setState(() {
                                //refresh UI
                                passenable = !passenable;
                              });
                            },
                            icon: Icon(passenable == true
                                ? Icons.remove_red_eye
                                : Icons.password))
                        //eye icon if passenable = true, else, Icon is ***__
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
                          // String? loggedUsername =
                          final loginStatus = await supaBaseHandler.login(
                            _emailController!.text,
                            _passwordController!.text,
                          );

                          print(loginStatus);

                          // if (loggedUsername != null) {
                          if (loginStatus) {
                            switch (widget.pageFrom) {
                              case 'admin':
                                // GetStorage box = GetStorage();
                                // box.write('nome', loggedUsername);

                                // obtain shared preferences
                                // final prefs =
                                //     await SharedPreferences.getInstance();

                                // // set value
                                // await prefs.setString('nome', loggedUsername);

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        // const MenuModelsScreen(),
                                        const AdminHomeScreen(),
                                  ),
                                );
                              case 'requesting':
                                Navigator.of(context).pop();
                            }
                          } else {
                            _emailController!.clear();
                            _passwordController!.clear();

                            // print("usuario ou senha errados!");
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('usuario ou senha errados!'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: const BorderSide(
                        width: 2, // the thickness
                        // color: Color(0xFFe9a42c), // the color of the border
                        color: mySecondColor, // the color of the border
                      ),
                    ),
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
                    /* ... */
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(secondColor),
                    ),
                    child: Text(
                      'Recuperar senha',
                      style: TextStyle(fontSize: 20),
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
