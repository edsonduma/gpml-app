import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:stivy/models/model.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';

enum GeneroEnum { masculino, feminino }

class ModelsCreateScreen extends StatefulWidget {
  const ModelsCreateScreen({super.key});

  @override
  State<ModelsCreateScreen> createState() => _ModelsCreateScreenState();
}

class _ModelsCreateScreenState extends State<ModelsCreateScreen> {
  SupaBaseHandler supaBaseHandler = SupaBaseHandler();

  final diffBetweenInputs = 20.0;

  String nome = '', apelido = '', contactos = '';
  GeneroEnum _genero = GeneroEnum.masculino;
  double? altura, peito, cintura, anca, sapato;
  // late List<String> trabalhos;
  String trabalhos = '';
  // Initial Selected Value
  // String representante = 'Freelance';
  int representante = 0;

  // final types = [
  //   'Modelos',
  //   'Fotógrafos',
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
                                Model.TABLE_NAME, context),
                            builder: (_, snapshot) {
                              if (snapshot.hasError) {
                                return Container();
                              } else if (snapshot.hasData) {
                                // print("agencyTypes: ${snapshot}");
                                // print("agencyTypes.data: ${snapshot.data}");
                                // print(
                                //     "agencyTypes.length: ${snapshot.data!.length}");

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
                                  // hint: const Text('Selecione o Representante'),
                                  // disabledHint:
                                  //     const Text('Selecione o Representante'),
                                  isExpanded: true,
                                  // Initial Value
                                  value: representante,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  // Array list of types
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
                      SizedBox(height: diffBetweenInputs),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(children: [
                            Radio(
                              activeColor: secondColor,
                              value: GeneroEnum.masculino,
                              groupValue: _genero,
                              onChanged: (value) {
                                setState(() {
                                  _genero = value!;
                                });
                              },
                            ),
                            const Text('M'),
                            const SizedBox(width: 10),
                            Radio(
                              activeColor: secondColor,
                              value: GeneroEnum.feminino,
                              groupValue: _genero,
                              onChanged: (value) {
                                setState(() {
                                  _genero = value!;
                                });
                              },
                            ),
                            const Text('F'),
                          ]),
                        ],
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          altura = double.parse(value);
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
                          hintText: 'Altura',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          peito = double.parse(value);
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
                          hintText: 'Peito/Busto',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          cintura = double.parse(value);
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
                          hintText: 'Cintura',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          anca = double.parse(value);
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
                          hintText: 'Anca',
                          hintStyle: TextStyle(color: secondColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      SizedBox(height: diffBetweenInputs),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          sapato = double.parse(value);
                        },
                        decoration: InputDecoration(
                          // border: const OutlineInputBorder(),
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
                            Model myModel = Model(
                              representante: representante,
                              nome: nome,
                              apelido: apelido,
                              genero:
                                  _genero == GeneroEnum.masculino ? "M" : "F",
                              altura: altura!,
                              peito: peito!,
                              cintura: cintura!,
                              anca: anca!,
                              sapato: sapato!,
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
