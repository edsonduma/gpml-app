import 'package:stivy/models/agency.dart';
import 'package:stivy/models/model.dart';
import 'package:stivy/utils/sqflite_helper.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart.txt';

class AgencyCreateScreen extends StatefulWidget {
  const AgencyCreateScreen({super.key});

  @override
  State<AgencyCreateScreen> createState() => _AgencyCreateScreenState();
}

class _AgencyCreateScreenState extends State<AgencyCreateScreen> {
  // final Color mySecondColor = Color(0xFFc712a2);
  final diffBetweenInputs = 20.0;

  String? nome, foto, contactos;

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
                        'Cadastro de Agência',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Cadastrar Agência',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      // MyCustomInput(
                      //   labelName: 'Nome',
                      // ),
                      TextFormField(
                        onChanged: (value) {
                          // print('value: $value');
                          nome = value;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Nome',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      // const SizedBox(height: 30),
                      Text(
                        'Foto de Capa',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      ElevatedButton(
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
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
                          fixedSize: const Size(150, 45),
                        ),
                        onPressed: () {
                          // select image from mobile device.
                        },
                      ),
                      const SizedBox(height: 30),
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
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (nome!.isNotEmpty) {
                            Agency myAgency = Agency(
                              nome: nome!,
                              foto: foto!,
                              contactos: contactos!,
                            );

                            SqfliteHelper.insert(Agency.TABLE_NAME, {
                              'nome': myAgency.nome,
                              'foto': myAgency.foto,
                              'contactos': myAgency.contactos,
                            });

                            Navigator.of(context).pop();
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.only(
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
                          fixedSize: const Size(150, 45),
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
