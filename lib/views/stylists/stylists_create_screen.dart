import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:stivy/models/agency.dart';
import 'package:stivy/models/stylist.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';

enum GeneroEnum { masculino, feminino }

class StylistsCreateScreen extends StatefulWidget {
  const StylistsCreateScreen({super.key});

  @override
  State<StylistsCreateScreen> createState() => _StylistsCreateScreenState();
}

class _StylistsCreateScreenState extends State<StylistsCreateScreen> {
  SupaBaseHandler supaBaseHandler = SupaBaseHandler();

  final diffBetweenInputs = 20.0;

  String nome = '', apelido = '', contactos = '';
  String trabalhos = '';
  int representante = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
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
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
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
                        'Stylists',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Cadastrar Stylists',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black38, width: 3),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: SizedBox(
                          child: FutureBuilder(
                            future: supaBaseHandler.readData(
                                Agency.TABLE_NAME, context),
                            builder: (_, snapshot) {
                              if (snapshot.hasError) {
                                return Container();
                              } else if (snapshot.hasData) {
                                var agencyTypes = [
                                  {"id": 0, "name": 'Freelance'},
                                ];

                                snapshot.data?.forEach((item) {
                                  agencyTypes.add({
                                    "id": item["id"],
                                    "name": item["nome"],
                                  });
                                });

                                return DropdownButton(
                                  isExpanded: true,
                                  value: representante,
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: agencyTypes.map((item) {
                                    return DropdownMenuItem(
                                      value: item["id"] as int,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Text(
                                          item["name"].toString(),
                                          style: TextStyle(color: secondColor),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      representante = newValue!;
                                    });
                                  },
                                );
                              } else {
                                return const CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        onChanged: (value) {
                          nome = value;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: secondColor,
                            ),
                          ),
                          hintText: 'Nome',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        onChanged: (value) {
                          apelido = value;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: secondColor,
                            ),
                          ),
                          hintText: 'Apelido',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        'Trabalhos',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Colors.white,
                      //     // side: const BorderSide(
                      //     //   width: 2, // the thickness
                      //     //   color: Color(0xFFe9a42c), // the color of the border
                      //     // ),
                      //     fixedSize: const Size(150, 45),
                      //   ),
                      //   onPressed: () {},
                      //   child: const Padding(
                      //     padding: EdgeInsets.symmetric(
                      //         horizontal: 20, vertical: 10),
                      //     //   top: 10,
                      //     //   bottom: 10,
                      //     //   left: 8,
                      //     //   right: 8,
                      //     // ),
                      //     child: Text(
                      //       '+',
                      //       style: TextStyle(
                      //         color: mySecondColor,
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      trabalhos.isEmpty
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(150, 45),
                              ),
                              onPressed: () async {
                                // select image from mobile device.
                                final result =
                                    await FilePicker.platform.pickFiles();
                                if (result == null) return;

                                final file = result.files.first;
                                // if (kIsWeb) {
                                // setState(() => trabalhos = file.bytes);
                                // } else {
                                // }
                                if (!kIsWeb) {
                                  setState(() => trabalhos = file.path!);
                                }
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    color: mySecondColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                fixedSize: const Size(150, 45),
                              ),
                              onPressed: () {
                                setState(() => trabalhos = '');
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                child: Text(
                                  'x',
                                  style: TextStyle(
                                    color: mySecondColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                      // const SizedBox(height: 30),
                      SizedBox(height: diffBetweenInputs),
                      Text(
                        'Contactos',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      // SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        maxLines: 2,
                        onChanged: (value) {
                          contactos = value;
                        },
                        decoration: InputDecoration(
                          // border: const OutlineInputBorder(),
                          // hintText: 'Contactos',
                          // hintStyle: TextStyle(color: secondColor),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: primaryColor,
                            ),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: secondColor,
                            ),
                          ),
                        ),
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                          // decorationColor: secondColor,
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (nome.isNotEmpty) {
                            Stylist myStylist = Stylist(
                              representante: representante,
                              nome: nome,
                              apelido: apelido,
                              trabalhos: [trabalhos],
                              contactos: contactos,
                            );

                            // SqfliteHelper.insert(Model.TABLE_NAME, {
                            //   'nome': myModel.nome,
                            //   'apelido': myModel.apelido,
                            //   'altura': myModel.altura,
                            //   'cintura': myModel.cintura,
                            //   'anca': myModel.anca,
                            //   'sapato': myModel.sapato,
                            //   'trabalhos': myModel.trabalhos,
                            //   'contactos': myModel.contactos,
                            // });
                            supaBaseHandler.addData(
                              Stylist.TABLE_NAME,
                              myStylist.toMap(),
                              context,
                            );

                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: thirdColor,
                          // side: const BorderSide(
                          //   width: 2, // the thickness
                          //   color: Color(0xFFe9a42c), // the color of the border
                          // ),
                          fixedSize: const Size(150, 45),
                        ),
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
                              color: mySecondColor,
                              fontSize: 20,
                            ),
                          ),
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
