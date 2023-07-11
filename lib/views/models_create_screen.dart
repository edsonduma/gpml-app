import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart';

class ModelsCreateScreen extends StatefulWidget {
  const ModelsCreateScreen({super.key});

  @override
  State<ModelsCreateScreen> createState() => _ModelsCreateScreenState();
}

class _ModelsCreateScreenState extends State<ModelsCreateScreen> {
  // final Color mySecondColor = Color(0xFFc712a2);
  final diffBetweenInputs = 20.0;

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
                        'Hadja Models',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 40),
                      Text(
                        'Adicionar Modelos',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      MyCustomInput(
                        labelName: 'Nome',
                      ),
                      SizedBox(height: diffBetweenInputs),
                      MyCustomInput(
                        labelName: 'Apelido',
                      ),
                      SizedBox(height: diffBetweenInputs),
                      MyCustomInput(
                        labelName: 'Altura',
                      ),
                      SizedBox(height: diffBetweenInputs),
                      MyCustomInput(
                        labelName: 'Cintura',
                      ),
                      SizedBox(height: diffBetweenInputs),
                      MyCustomInput(
                        labelName: 'Anca',
                      ),
                      SizedBox(height: diffBetweenInputs),
                      MyCustomInput(
                        labelName: 'Sapato',
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Trabalhos',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          //   top: 10,
                          //   bottom: 10,
                          //   left: 8,
                          //   right: 8,
                          // ),
                          child: Text(
                            '+',
                            style: TextStyle(
                              color: Color(0xFFc712a2),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          // side: const BorderSide(
                          //   width: 2, // the thickness
                          //   color: Color(0xFFe9a42c), // the color of the border
                          // ),
                          fixedSize: Size(150, 45),
                        ),
                        onPressed: () {},
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Contactos',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        // minLines:
                        //     2, // any number you need (It works as the rows for the textarea)
                        // keyboardType: TextInputType.multiline,
                        maxLines: 2,
                      ),
                      SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                            left: 8,
                            right: 8,
                          ),
                          child: Text(
                            'Add',
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
                          fixedSize: Size(150, 45),
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
