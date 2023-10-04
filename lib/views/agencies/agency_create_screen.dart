import 'package:file_picker/file_picker.dart';
import 'package:stivy/models/agency.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';

class AgencyCreateScreen extends StatefulWidget {
  const AgencyCreateScreen({super.key});

  @override
  State<AgencyCreateScreen> createState() => _AgencyCreateScreenState();
}

class _AgencyCreateScreenState extends State<AgencyCreateScreen> {
  late SupaBaseHandler supaBaseHandler = SupaBaseHandler();
  final diffBetweenInputs = 20.0;
  String nome = '', foto = '', contactos = '';
  TextEditingController? contactosController = TextEditingController();

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
            // Container(
            //   alignment: Alignment.centerLeft,
            //   child: TextButton(
            //     onPressed: () => Navigator.of(context).pop(),
            //     style: const ButtonStyle(
            //       backgroundColor: MaterialStatePropertyAll(mySecondColor),
            //     ),
            //     child: Text(
            //       'voltar',
            //       style: TextStyle(
            //         // color: secondColor,
            //         color: Colors.white,
            //         // backgroundColor: secondColor,
            //         fontSize: 20,
            //       ),
            //     ),
            //   ),
            // ),

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
                      foto.isEmpty
                          ? ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                // side: const BorderSide(
                                //   width: 2, // the thickness
                                //   color: Color(0xFFe9a42c), // the color of the border
                                // ),
                                fixedSize: const Size(150, 45),
                              ),
                              onPressed: () async {
                                // select image from mobile device.
                                final result =
                                    await FilePicker.platform.pickFiles();
                                if (result == null) return;

                                final file = result.files.first;
                                // openFile(file);

                                // foto = file.path!;
                                // setState(() => foto);
                                setState(() => foto = file.path!);
                              },
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
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                // side: const BorderSide(
                                //   width: 2, // the thickness
                                //   color: Color(0xFFe9a42c), // the color of the border
                                // ),
                                fixedSize: const Size(150, 45),
                              ),
                              onPressed: () {
                                setState(() => foto = '');
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                //   top: 10,
                                //   bottom: 10,
                                //   left: 8,
                                //   right: 8,
                                // ),
                                child: Text(
                                  'x',
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
                        controller: contactosController,
                        // minLines:
                        //     2, // any number you need (It works as the rows for the textarea)
                        maxLines: 2,
                        // keyboardType: TextInputType.multiline,
                        keyboardType: TextInputType.phone,
                        // onChanged: (value) {
                        //   print("$value, value.length: ${value.length}");
                        //   // contactos = '';
                        //   if (value.length % 9 == 0) {
                        //     if (value.isNotEmpty) {
                        //       //   contactos = "$contactos; $value";
                        //       // } else {
                        //       //   contactos = value;

                        //       contactosController!.text = "$value; ";
                        //     }

                        //     print("contactos: $value");
                        //   }
                        // },
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          if (nome.isNotEmpty) {
                            var [..., lastValue] = foto.trim().split("/");

                            Agency myAgency = Agency(
                              // id: null,
                              nome: nome.trim(),
                              foto: lastValue,
                              // contactos: contactos!,
                              contactos: contactosController!.text.trim(),
                            );

                            // SqfliteHelper.insert(Agency.TABLE_NAME, {
                            //   'nome': myAgency.nome,
                            //   'foto': myAgency.foto,
                            //   'contactos': myAgency.contactos,
                            // });
                            supaBaseHandler.addData(
                              Agency.TABLE_NAME,
                              myAgency.toMap(),
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
