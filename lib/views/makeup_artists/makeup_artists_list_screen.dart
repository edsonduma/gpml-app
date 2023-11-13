import 'package:stivy/models/makeup_artist.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/makeup_artists/makeup_artists_details_screen.dart';

class MakeupArtistsListScreen extends StatefulWidget {
  const MakeupArtistsListScreen({super.key});

  @override
  State<MakeupArtistsListScreen> createState() =>
      _MakeupArtistsListScreenState();
}

class _MakeupArtistsListScreenState extends State<MakeupArtistsListScreen> {
  late SupaBaseHandler supaBaseHandler = SupaBaseHandler();

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
            MyCustomAppBar(),
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
                    left: 50,
                    right: 50,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Maquiadores'.toUpperCase(),
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'TODOS'.toUpperCase(),
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            'MULHERES'.toUpperCase(),
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 30),
                          Text(
                            'HOMENS'.toUpperCase(),
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(width: 20),
                        ],
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: InputDecoration(
                          // border: const OutlineInputBorder(),
                          hintText: 'Pesquisar',
                          // hintStyle: TextStyle(color: secondColor),
                          hintStyle: TextStyle(color: thirdColor),
                        ),
                        style: TextStyle(
                          color: secondColor,
                        ),
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //   ],
                      // ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // ElevatedButton(
                          //   child: Text('Pesquisa Avancada'),
                          //   onPressed: () {},
                          // ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: thirdColor,
                              // side: const BorderSide(
                              //   width: 2, // the thickness
                              //   color: Color(0xFFe9a42c), // the color of the border
                              // ),
                              fixedSize: const Size(250, 45),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                top: 10,
                                bottom: 10,
                                // left: 15,
                                // right: 15,
                              ),
                              child: Text(
                                'Pesquisa Avancada',
                                style: TextStyle(
                                  color: mySecondColor,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 500,
              child: FutureBuilder(
                future:
                    supaBaseHandler.readData(MakeupArtist.TABLE_NAME, context),
                builder: (_, AsyncSnapshot snapshot) {
                  // print("snapshot: ${snapshot}");
                  // print("snapshot.data: ${snapshot.data}");
                  // print("snapshot.data.length: ${snapshot.data!.length}");
                  // print("snapshot.data: ${snapshot.data!}");

                  if (snapshot.hasError) {
                    return Container();
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          // number of items per row

                          // maxCrossAxisExtent: 120,
                          maxCrossAxisExtent: 120,
                          childAspectRatio: 3 / 4,
                          crossAxisSpacing: 11,
                          // mainAxisSpacing: 20,
                        ),
                        // scrollDirection: Axis.vertical,
                        // number of items in your list
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, int index) {
                          // var agencyNames =
                          //     snapshot.data![index]["nome"]!.split(" ");

                          // var nameFormatted = '';
                          // int size = agencyNames.length - 1;

                          // for (var i = 0; i < size; i++) {
                          //   nameFormatted += agencyNames[i];
                          //   nameFormatted += '\n';
                          // }
                          // nameFormatted += agencyNames[size];

                          return InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    MakeupArtistsDetailsScreen.setModel(
                                        dataModel: snapshot.data![index]),
                              ),
                            ),
                            child: Column(
                              children: [
                                Card(
                                  child: Container(
                                    // color: Colors.black,
                                    // width: 120,
                                    // height: 150,
                                    width: 100,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                        image: Image.asset(
                                          'assets/images/background_presentation.jpg',
                                          errorBuilder: (BuildContext context,
                                              Object exception,
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
                                ),
                                Text(
                                  snapshot.data![index]["nome"],
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: mySecondColor,
                      ),
                    );
                  }
                },
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       child: Column(
            //         children: [
            //           Card(
            //             child: Container(
            //               color: Colors.black,
            //               width: 120,
            //               height: 150,
            //             ),
            //           ),
            //           const Text(
            //             'Cael Pascoal',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //       onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const MakeupArtistsDetailsScreen(),
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       child: Column(
            //         children: [
            //           Card(
            //             child: Container(
            //               color: Colors.black,
            //               width: 120,
            //               height: 150,
            //             ),
            //           ),
            //           const Text(
            //             'Emma Diogo',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //       onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const MakeupArtistsDetailsScreen(),
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       child: Column(
            //         children: [
            //           Card(
            //             child: Container(
            //               color: Colors.black,
            //               width: 120,
            //               height: 150,
            //             ),
            //           ),
            //           const Text(
            //             'Nádia Campos',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //       onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const MakeupArtistsDetailsScreen(),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // const SizedBox(height: 15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     InkWell(
            //       child: Column(
            //         children: [
            //           Card(
            //             child: Container(
            //               color: Colors.black,
            //               width: 120,
            //               height: 150,
            //             ),
            //           ),
            //           const Text(
            //             'Stélvia Firmino',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //       onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const MakeupArtistsDetailsScreen(),
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       child: Column(
            //         children: [
            //           Card(
            //             child: Container(
            //               color: Colors.black,
            //               width: 120,
            //               height: 150,
            //             ),
            //           ),
            //           const Text(
            //             'Stélvia Firmino',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //       onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const MakeupArtistsDetailsScreen(),
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       child: Column(
            //         children: [
            //           Card(
            //             child: Container(
            //               color: Colors.black,
            //               width: 120,
            //               height: 150,
            //             ),
            //           ),
            //           const Text(
            //             'Stélvia Firmino',
            //             style: TextStyle(
            //               color: Colors.white,
            //             ),
            //           ),
            //         ],
            //       ),
            //       onTap: () => Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const MakeupArtistsDetailsScreen(),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
