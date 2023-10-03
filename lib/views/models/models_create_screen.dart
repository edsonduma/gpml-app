import 'package:stivy/models/agency.dart';
import 'package:stivy/models/model.dart';
import 'package:stivy/utils/sqflite_helper.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/components/my_custom_input.dart.txt';

class ModelsCreateScreen extends StatefulWidget {
  const ModelsCreateScreen({super.key});

  @override
  State<ModelsCreateScreen> createState() => _ModelsCreateScreenState();
}

class _ModelsCreateScreenState extends State<ModelsCreateScreen> {
  SupaBaseHandler supaBaseHandler = SupaBaseHandler();

  final diffBetweenInputs = 20.0;

  String? nome, apelido, genero, contactos;
  double? altura, cintura, anca, sapato;
  late List<String> trabalhos;
  // Initial Selected Value
  // String representante = 'Freelance';
  int representante = 0;

  // final types = [
  //   'Modelos',
  //   'Fotografos',
  //   'Designers',
  //   'Stylist',
  //   'Make up',
  // ];

  // var agencyTypes = [
  //   {"id": 0, "name": 'Freelance'},
  // ];

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   final myAgenciesList = supaBaseHandler.readData(Agency.TABLE_NAME, context);
  //   // print('myAgenciesList: $myAgenciesList');
  //   // myAgenciesList.then((value) => print('value: $value'));
  //   myAgenciesList.then(
  //     (value) => value?.map((item) {
  //       agencyTypes.add(
  //         {
  //           "id": item["id"],
  //           "name": item["nome"],
  //         },
  //       );

  //       // setState(() {});
  //       print('agencyTypes: $agencyTypes');
  //     }),
  //   );

  //   // final agencyTypes = [
  //   //   {"id": 0, "name": 'Freelance'},
  //   //   {"id": 1, "name": 'Agenciado'},
  //   // ];
  // }

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
            // const SizedBox(height: 30),
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
                        'Modelos',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        'Cadastrar Modelos',
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      // MyCustomInput(
                      //   labelName: 'Nome',
                      // ),
                      DecoratedBox(
                        // hintText: 'Vinculação',
                        decoration: BoxDecoration(
                          // border: Border.all(),
                          border: Border.all(color: Colors.black38, width: 3),
                          borderRadius: BorderRadius.circular(5),
                          // hintStyle: TextStyle(color: secondColor),
                        ),
                        // style: TextStyle(
                        //   color: secondColor,
                        // ),
                        child: SizedBox(
                          // width: MediaQuery.of(context).size.width,
                          child: FutureBuilder(
                            future: supaBaseHandler.readData(
                                Agency.TABLE_NAME, context),
                            builder: (_, snapshot) {
                              if (snapshot.hasError) {
                                return Container();
                              } else if (snapshot.hasData) {
                                // print("agencyTypes: ${snapshot}");
                                print("agencyTypes.data: ${snapshot.data}");
                                print(
                                    "agencyTypes.length: ${snapshot.data!.length}");

                                var agencyTypes = [
                                  {"id": 0, "name": 'Freelance'},
                                ];

                                snapshot.data?.forEach((item) {
                                  agencyTypes.add({
                                    "id": item["id"],
                                    "name": item["nome"],
                                  });

                                  // print('1:agencyTypes: $agencyTypes');
                                });
                                // snapshot.data!.forEach((element) { });

                                // print('2:agencyTypes: $agencyTypes');
                                // setState(() {});
                                // child: DropdownButton(

                                return DropdownButton(
                                  isExpanded: true,
                                  // Initial Value
                                  value: representante,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of types
                                  items: agencyTypes.map((item) {
                                    return DropdownMenuItem(
                                      value: item["id"] as int,
                                      child: Text(
                                        item["name"].toString(),
                                        style: TextStyle(color: secondColor),
                                      ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
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
                      TextFormField(
                        onChanged: (value) {
                          apelido = value;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Apelido',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      genero,
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        onChanged: (value) {
                          altura = value as double?;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Altura',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        onChanged: (value) {
                          // cintura = value as double?;

                          cintura = double.parse(value);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Cintura',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        onChanged: (value) {
                          anca = double.parse(value);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Anca',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        onChanged: (value) {
                          sapato = double.parse(value);
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          hintText: 'Sapato',
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
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          // side: const BorderSide(
                          //   width: 2, // the thickness
                          //   color: Color(0xFFe9a42c), // the color of the border
                          // ),
                          fixedSize: const Size(150, 45),
                        ),
                        onPressed: () {},
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
                              color: mySecondColor,
                              fontSize: 20,
                            ),
                          ),
                        ),
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
                            Model myModel = Model(
                              representante: representante,
                              nome: nome!,
                              apelido: apelido!,
                              genero: genero!,
                              altura: altura!,
                              cintura: cintura!,
                              anca: anca!,
                              sapato: sapato!,
                              trabalhos: trabalhos,
                              contactos: contactos!,
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
                              Model.TABLE_NAME,
                              myModel.toMap(),
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
