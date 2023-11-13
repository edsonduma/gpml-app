import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';

class AboutScreen extends StatelessWidget {
  final myAgency;

  AboutScreen({super.key, this.myAgency});

  final aboutText =
      '\t\t\t\t\t\t\tA Hadja Models Angola é uma agência líder de modelos no mercado Angolano desde 2010, tendo para além do agenciamento de modelos, músicos, actores e apresentadores de televisão, dedica-se ainda aprodução de vários eventos anuais como Angola Fashion Week, Moda Solidária, em aégide do Comité MisterAngola. \n\t\t\t\t\t\t\tEm seu portfólio constam tam 78 modelos do sexo masculino e feminino com participações em eventos mundiais como New York Fashion Week, Africa Fashion Week Africa Fashion Week, Joanesburg Fashion Week, Mocambique FW, Botswana Fashion Week, Botswana Fashion Week e muitos outros Junto a este curriculum colocamos o nosso selo de Empresa de Sucesso Angola.';

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
            MyCustomAppBar(),
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
                    left: 120,
                    right: 120,
                    bottom: 30,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Sobre',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        // 'Hadja Models',
                        // myAgency["nome"],
                        myAgency.nome,
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: Text(
                // aboutText,
                // myAgency["sobre"],
                myAgency.sobre,
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      'www.hadjamodels.com',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      'Rua BFA, Benfica',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '+224900000000',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
