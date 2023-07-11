import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/login_screen.dart';
import 'package:stivy/views/register_screen.dart';
import 'package:stivy/views/home_screen.dart';

// Future addProds(prod) async {
//   final response = await http.post(
//     Uri.parse('http://192.168.29.24:8000/api/produtos'),
//     headers: <String, String>{
//       'Content-Type': 'application/json; charset=UTF-8',
//     },
//     body: json.encode({
//       'Nome do Utilizador': prod.Nome do Utilizador,
//       'loja': prod.loja[0],
//       'preco': prod.preco,
//     }),
//   );

//   if (response.statusCode == 200) {
//     //   // If the server did return a 200 OK response,
//     //   // then parse the JSON.
//     return Prod.fromJson(jsonDecode(response.body));
//   } else {
//     //   // If the server did not return a 200 OK response,
//     //   // then throw an exception.
//     print('response.statusCode: ${response.statusCode}');
//   }
// }

class PresentationScreen extends StatelessWidget {
  const PresentationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    double heightScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: widthScreen,
              height: heightScreen - heightScreen / 3,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  // image: AssetImage('images/vector-excited-audience.jpg'),
                  image:
                      AssetImage('assets/images/background_presentation.jpg'),
                  // image: Image.asset('images/background_presentation.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              // decoration: BoxDecoration(
              //   image: DecorationImage(
              //     image: NetworkImage(
              //         'https://static.vecteezy.com/system/resources/previews/000/236/927/original/vector-excited-audience.jpg'),
              //     fit: BoxFit.cover,
              //   ),
              // ),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 80,
                  left: 70,
                  right: 70,
                  bottom: 220,
                ),
                child: Text(
                  'Tudo que você precisa saber sobre os melhores profissionais e dos melhores eventos de moda você encontra aqui.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: secondColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 3.0,
                        // color: Color.fromARGB(255, 0, 0, 0),
                        color: Colors.black,
                      ),
                      Shadow(
                        offset: Offset(2.0, 2.0),
                        blurRadius: 8.0,
                        // color: Color.fromARGB(125, 0, 0, 255),
                        color: Colors.white,
                        // color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ),
              //padding: <-- Using to shift text position a little bit for your requirement
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(width: 20),
                // ElevatedButton(
                //   // onPressed: () => LoginScreen(),
                //   onPressed: () => Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => LoginScreen(),
                //     ),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.only(
                //       top: 10,
                //       bottom: 10,
                //       left: 8,
                //       right: 8,
                //     ),
                //     child: Text(
                //       'Membro',
                //       style: TextStyle(
                //         color: secondColor,
                //         fontWeight: FontWeight.bold,
                //         fontSize: 25,
                //       ),
                //     ),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: primaryColor,
                //     side: const BorderSide(
                //       width: 2, // the thickness
                //       color: Color(0xFFc712a2), // the color of the border
                //     ),
                //   ),
                // ),
                // SizedBox(width: 65),
                ElevatedButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
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
                      'Ver mais...',
                      style: TextStyle(
                        color: secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    side: const BorderSide(
                      width: 2, // the thickness
                      color: Color(0xFFc712a2), // the color of the border
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                // onPressed: () => RegisterScreen(),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegisterScreen(),
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
                    'Cadastrar',
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 20,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: const BorderSide(
                    width: 2, // the thickness
                    color: Color(0xFFe9a42c), // the color of the border
                  ),
                ),
                /* ... */
              ),
            ),
            // SizedBox(height: 13),
            // SizedBox(height: 20),
            // Text(
            //   "Por favor, insira os seus dados!",
            //   style: TextStyle(
            //     fontSize: 18,
            //     fontWeight: FontWeight.w500,
            //     color: Colors.grey[400],
            //   ),
            // ),
            // SizedBox(height: 10),
            // SizedBox(
            //   height: 55,
            //   width: double.infinity,
            //   child: TextButton(
            //     style: TextButton.styleFrom(
            //       backgroundColor: secondColor,
            //       foregroundColor: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     onPressed: () {
            //       // if (_userTextFieldController.text == "admin" &&
            //       //     _pwdTextFieldController.text == "admin") {

            //       // // // Navigator.push(
            //       // // //   context,
            //       // // //   MaterialPageRoute(
            //       // // //     builder: (context) => Home(),
            //       // // //   ),
            //       // // // );

            //       // }

            //       // _userTextFieldController.text = '';
            //       // _pwdTextFieldController.text = '';
            //     },
            //     child: Text("Aceder"),
            //   ),
            // ),
            // SizedBox(height: 10),
            // SizedBox(
            //   height: 55,
            //   width: double.infinity,
            //   child: TextButton(
            //     style: TextButton.styleFrom(
            //       backgroundColor: secondColor,
            //       foregroundColor: Colors.white,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(12),
            //       ),
            //     ),
            //     onPressed: () {
            //       // Navigator.push(
            //       //   context,
            //       //   MaterialPageRoute(
            //       //     builder: (context) => CreateUserView(),
            //       //   ),
            //       // );
            //     },
            //     child: Text("Cadastrar"),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
