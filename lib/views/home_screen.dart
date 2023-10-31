import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stivy/models/agency.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/views/components/my_custom_buttons.dart';
import 'package:stivy/views/agencies/agencies_list_screen.dart';
import 'package:stivy/views/designers/designers_list_screen.dart';
import 'package:stivy/views/makeup_artists/makeup_artists_list_screen.dart';
import 'package:stivy/views/models/models_list_screen.dart';
import 'package:stivy/views/photographers/photographers_list_screen.dart';
import 'package:stivy/views/stylists/stylists_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: primaryColor,
        // appBar: AppBar(
        //   backgroundColor: primaryColor,
        // ),
        body: Column(
          children: [
            const SizedBox(height: 30),
            MyCustomAppBar(),
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30.0),
              ),
              child: Container(
                color: Colors.white,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Text(
                      'Serviços Disponíveis',
                      style: TextStyle(
                        color: secondColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      'Escolha os nossos serviços',
                      style: TextStyle(
                        color: secondColor,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TabBar(
                      // labelColor: Colors.red,
                      isScrollable: true,
                      unselectedLabelColor: primaryColor,
                      labelColor: secondColor,
                      indicatorColor: secondColor,
                      // dividerColor: Colors.green,
                      // overlayColor: MaterialStatePropertyAll(Colors.blue),
                      // indicatorColor: Colors.pink,
                      // unselectedLabelColor: Colors.orange,
                      tabs: [
                        // Tab(text: 'Agências de Moda'),
                        Tab(
                          // child: Text(
                          //   'Agências de Moda',
                          //   style: TextStyle(
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 15.0,
                          //   ),
                          // ),
                          child: myText('Agências de Moda'),
                        ),
                        Tab(child: myText('Modelos free')),
                        Tab(child: myText('Fotógrafos')),
                        Tab(child: myText('Designers')),
                        Tab(child: myText('Stylists')),
                        Tab(child: myText('Makeup artists')),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(children: [
                // const Center(
                //   child: Text('Agências de Moda'),
                // ),
                AgencyDisplayWidget(),
                Center(
                  child: Text(
                    'Modelos free',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      backgroundColor: myForthColor,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Fotógrafos',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Designers',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Stylists',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Makeup artists',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Text myText(label) => Text(
        label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15.0,
          // fontFamily: 'Clarendon FS',
        ),
      );
}

class AgencyDisplayWidget extends StatefulWidget {
  const AgencyDisplayWidget({super.key});

  @override
  State<AgencyDisplayWidget> createState() => _AgencyDisplayWidgetState();
}

class _AgencyDisplayWidgetState extends State<AgencyDisplayWidget> {
  //   with TickerProviderStateMixin {
  // late TabController _tabController;
  late SupaBaseHandler supaBaseHandler = SupaBaseHandler();
  late List<Agency> items = [];
  late List? listOfAgencies = [];
  final _random = Random();
  // final session = supabase.auth.currentSession;

  @override
  void initState() {
    // _tabController = TabController(length: 2, vsync: this);
    super.initState();

    getAllProds();
    // setState(() async {
    //   listOfAgencies =
    //       await
    // });
  }

  int randomNumber(int min, int max) => min + _random.nextInt(max - min);

  Future getAllProds() async {
    // setState(() => items.clear());
    setState(() => items = []);

    listOfAgencies = await supaBaseHandler.readData(Agency.TABLE_NAME, context);

    List<Agency> tempItems = [];
    Agency temp = Agency(
      nome: '',
      foto: '',
      sobre: '',
      contactos: '',
    );

    for (var item in listOfAgencies!) {
      // print('string: $item:' + temp.nome);

      temp = Agency(
        nome: item['nome'],
        sobre: item['sobre'],
        foto: item['foto'],
        contactos: item['contactos'],
      );

      tempItems.add(temp);
    }

    setState(() => items.addAll(tempItems));

    // print("finalizando a solicitacao...");

    return Future.value(listOfAgencies);
  }

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  Padding bigCover({
    required Color color,
    required double size,
  }) =>
      Padding(
        padding: const EdgeInsets.only(
          top: 20.0,
          bottom: 0,
          left: 150.0,
          right: 150.0,
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(20.0),
          ),
          child: Container(
            color: color,
            width: size * 0.3,
            height: size,
          ),
        ),
      );

  SizedBox miniCover({
    required Color color,
    required double size,
  }) =>
      SizedBox(
        height: size * 0.4,
        child: Tab(
          child: Padding(
            padding: const EdgeInsets.only(
              // top: 0,
              bottom: 20,
              // left: 5,
              // right: 5,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
              child: Container(
                color: color,
                width: size * 0.3,
                height: size,
              ),
            ),
          ),
        ),
      );

  Card myCard = Card(
    child: Container(
      // color: Colors.black,
      // width: 150,
      // height: 130,
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        color: Colors.black,
        image: DecorationImage(
          image: Image.asset(
            'assets/images/background_presentation.jpg',
            errorBuilder: (BuildContext context, Object exception,
                StackTrace? stackTrace) {
              return Image.asset(
                'assets/images/background_presentation.jpg',
              );
            },
          ).image,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // length: 7,
      length: items.length,
      child: Scaffold(
        // backgroundColor: thirdColor,
        backgroundColor: myForthColor,
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
        //   child: SizedBox(
        //     width: MediaQuery.of(context).size.width / 3,
        //     height: 40,
        //     child: ElevatedButton(
        //       onPressed: () {},
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: secondColor,
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.all(Radius.circular(15.0)),
        //           // side: BorderSide(color: Colors.red),
        //         ),
        //       ),
        //       child: Text('Adicionar Nova'),
        //     ),
        //   ),
        // ),
        floatingActionButton: supabase.auth.currentSession == null
            ? null
            : FloatingActionButton(
                backgroundColor: secondColor,
                onPressed: () {},
                child: const Icon(
                  Icons.add,
                  size: 30,
                ),
              ),
        body: items.isEmpty
            ? Center(
                child: CircularProgressIndicator(
                color: secondColor,
              ))
            : Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: TabBarView(
                      // controller: _tabController,
                      children: items
                          .map(
                            (e) =>
                                // myCard
                                Padding(
                              // padding: EdgeInsets.only(top: 30.0),
                              padding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 0,
                                left: 150.0,
                                right: 150.0,
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(20.0),
                                ),
                                child: Container(
                                  color: Colors.black,
                                  child: Image(
                                    image: AssetImage(
                                        'assets/images/models/foto0${randomNumber(1, 7)}.jpg'),
                                    // image: AssetImage(
                                    //     'assets/images/background_presentation.jpg'),
                                    // image: Image.asset(
                                    //         'assets/images/models/foto0${randomNumber(1, 7)}.jpg')
                                    //     .image,
                                    // image: Image.asset(
                                    //         'assets/images/background_presentation.jpg')
                                    // .image,
                                  ),
                                ),
                              ),
                            ),

                            // bigCover(
                            //   color: Colors.black,
                            //   size: 200,
                            // ),
                          )
                          .toList(),
                      // [
                      //   bigCover(
                      //     color: Colors.black,
                      //     size: 200,
                      //   ),
                      //   bigCover(
                      //     color: Colors.green,
                      //     size: 200,
                      //   ),
                      //   bigCover(
                      //     color: Colors.blue,
                      //     size: 200,
                      //   ),
                      //   bigCover(
                      //     color: Colors.red,
                      //     size: 200,
                      //   ),
                      //   bigCover(
                      //     color: Colors.yellow,
                      //     size: 200,
                      //   ),
                      //   bigCover(
                      //     color: Colors.white,
                      //     size: 200,
                      //   ),
                      //   bigCover(
                      //     color: Colors.pink,
                      //     size: 200,
                      //   ),
                      // ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: TabBar(
                        // controller: _tabController,
                        isScrollable: true,
                        tabs: items
                            .map(
                              (e) => Text(e.nome),
                              // Row(
                              //   children: [
                              //     Image(
                              //       image: AssetImage(
                              //           'assets/images/models/foto0${randomNumber(1, 7)}.jpg'),
                              //     ),
                              //     Text(e.nome),
                              //   ],
                              // ),
                              // miniCover(
                              //   color: Colors.black,
                              //   size: 300,
                              // ),
                            )
                            .toList()
                        // [
                        //   miniCover(
                        //     color: Colors.black,
                        //     size: 300,
                        //   ),
                        //   // SizedBox(
                        //   //   height: 200,
                        //   //   child: Tab(
                        //   //     child:

                        //   //   ),
                        //   // ),
                        //   miniCover(
                        //     color: Colors.green,
                        //     size: 300,
                        //   ),
                        //   miniCover(
                        //     color: Colors.blue,
                        //     size: 300,
                        //   ),
                        //   miniCover(
                        //     color: Colors.red,
                        //     size: 300,
                        //   ),
                        //   miniCover(
                        //     color: Colors.yellow,
                        //     size: 300,
                        //   ),
                        //   miniCover(
                        //     color: Colors.white,
                        //     size: 300,
                        //   ),
                        //   miniCover(
                        //     color: Colors.pink,
                        //     size: 300,
                        //   ),
                        //   // Tab(
                        //   //   child: miniCover(
                        //   //     color: Colors.green,
                        //   //     size: 500,
                        //   //   ),
                        //   // ),
                        //   // Tab(
                        //   //   child: miniCover(
                        //   //     color: Colors.blue,
                        //   //     size: 500,
                        //   //   ),
                        //   // ),
                        // ],
                        ),
                  ),
                ],
              ),
      ),
    );
  }
}
