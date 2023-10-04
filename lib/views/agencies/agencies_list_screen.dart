import 'package:stivy/models/agency.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/agencies/agency_details_screen.dart';

class AgenciesListScreen extends StatefulWidget {
  const AgenciesListScreen({super.key});

  @override
  State<AgenciesListScreen> createState() => _AgenciesListScreenState();
}

class _AgenciesListScreenState extends State<AgenciesListScreen> {
  // List _listOfAgencies = [];
  // Future<List<Map<String, dynamic>>> _listOfAgencies = Future(() => []);
  // double? _widthScreen;
  late SupaBaseHandler supaBaseHandler = SupaBaseHandler();

  List<Widget>? myList;

  @override
  initState() {
    super.initState();

    // setState(() {
    //   _listOfAgencies = SupabaseHelper.getAllList(Agency.TABLE_NAME);
    // });
    // print("_listOfAgencies: $_listOfAgencies");
  }

  // final Future<String> _calculation = Future<String>.delayed(
  //   const Duration(seconds: 2),
  //   () => 'Data Loaded',
  // );

  // initData() async {

  //   // myList = generateMyList();
  // }

  // List<Widget> generateMyList() {
  //   // List<Widget> myList = _listOfAgencies!.map((e) => Container());
  //   List<Widget> myList = [];

  //   for (var i = 0; i < _listOfAgencies.length; i++) {
  //     // myList.add(_listOfAgencies![i]);
  //     myList.add(
  //       // _listOfAgencies![i]
  //       InkWell(
  //         child: Column(
  //           children: [
  //             Card(
  //               child: Container(
  //                 color: Colors.black,
  //                 width: 120,
  //                 height: 150,
  //               ),
  //             ),
  //             Text(
  //               _listOfAgencies![i].nome,
  //               style: TextStyle(
  //                 color: Colors.white,
  //               ),
  //             ),
  //           ],
  //         ),
  //         onTap: () => Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => AgencyDetailsScreen(),
  //           ),
  //         ),
  //       ),
  //     );
  //   }

  //   print("myList: $myList");

  //   return myList;
  // }

  @override
  Widget build(BuildContext context) {
    // Future<List<Map<String, dynamic>>> myAgenciesList = ;
    // _widthScreen = MediaQuery.of(context).size.width;

    // print("_listOfAgencies: $_listOfAgencies");
    // print("length: ${_listOfAgencies.length}");

    // height: MediaQuery.of(context).size.height,
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            MyCustomAppBar(),
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
                    left: 50,
                    right: 50,
                    bottom: 10,
                  ),
                  child: Column(
                    children: [
                      Text(
                        'As melhores agencias da cidade capital você encontra aqui!',
                        style: TextStyle(
                          color: secondColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(height: 10),
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
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 5),
            // GridView.count(
            //   crossAxisCount: 3,
            //   children: SupabaseHelper.getList(Agency.TABLE_NAME).,
            // ),
            SizedBox(
              height: 500,
              child: FutureBuilder(
                future: supaBaseHandler.readData(Agency.TABLE_NAME, context),
                builder: (_, AsyncSnapshot snapshot) {
                  // print("snapshot: ${snapshot}");
                  // print("snapshot.data: ${snapshot.data}");
                  // print("snapshot.data.length: ${snapshot.data!.length}");
                  // print("snapshot.data: ${snapshot.data!}");

                  if (snapshot.hasError) {
                    return Container();
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                        // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        // crossAxisCount: 3,
                        // // vertical spacing between the items
                        // mainAxisSpacing: 10,
                        // // horizontal spacing between the items
                        // crossAxisSpacing: 10,
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
                        // itemCount: 20,
                        itemCount: snapshot.data!.length,
                        // SupabaseHelper.getList(Agency.TABLE_NAME)
                        itemBuilder: (_, int index) {
                          var agencyNames =
                              snapshot.data![index]["nome"]!.split(" ");

                          var nameFormatted = '';
                          int size = agencyNames.length - 1;

                          for (var i = 0; i < size; i++) {
                            nameFormatted += agencyNames[i];
                            nameFormatted += '\n';
                          }
                          nameFormatted += agencyNames[size];

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AgencyDetailsScreen(
                                      myAgency: snapshot.data![index]),
                                ),
                              );
                            },
                            child: Column(
                              children: [
                                Card(
                                  child: Container(
                                    // color: Colors.black,
                                    // width: 150,
                                    // height: 130,
                                    width: 100,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      image: DecorationImage(
                                        // image: AssetImage(''),
                                        // image: AssetImage() ??
                                        // image: AssetImage(
                                        //             "assets/images/${myFotos[myFotos.length - 1]}") ==
                                        //         null
                                        //     ? AssetImage(
                                        //         'assets/images/background_presentation.jpg')
                                        //     : AssetImage(
                                        //         "assets/images/${myFotos[myFotos.length - 1]}"),

                                        // AssetImage(
                                        //     "assets/images/$lastValue"),

                                        // Image.asset(
                                        //   "assets/images/${myFotos[myFotos.length - 1]}",
                                        //   width: 90,
                                        //   errorBuilder: (BuildContext context,
                                        //       Object exception,
                                        //       StackTrace stackTrace) {
                                        //     return Image.asset(
                                        //       "assets/images/your_sample_image.png",
                                        //       width: 90,
                                        //     );
                                        //   },
                                        // ),

                                        image: Image.asset(
                                          // "assets/images/$lastValue",
                                          'assets/images/background_presentation.jpg',
                                          // width: 90,
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                            return Image.asset(
                                              'assets/images/background_presentation.jpg',
                                              // width: 90,
                                            );
                                          },
                                        ).image,

                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  // 'Cael Pascoal',
                                  // 'testetstetstetste',
                                  nameFormatted,
                                  // snapshot.data![index]["nome"] == null
                                  //     ? 'default'
                                  //     : snapshot.data![index]["nome"],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    // fontWeight: FontWeight.bold,
                                    fontSize: 22,
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

            // GridView.extent(
            //   // maxCrossAxisExtent: _widthScreen!,
            //   maxCrossAxisExtent: 200,
            //   mainAxisSpacing: 10,
            //   crossAxisSpacing: 10,
            //   padding: EdgeInsets.all(10),
            //   children: _listOfAgencies == null
            //       ? <Widget>[Container()]
            //       : generateMyList(),
            // ),

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
            //           Text(
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
            //           builder: (context) => AgencyDetailsScreen(),
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
            //           Text(
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
            //           builder: (context) => AgencyDetailsScreen(),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
            // SizedBox(height: 15),
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
            //           Text(
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
            //           builder: (context) => AgencyDetailsScreen(),
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
            //           Text(
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
            //           builder: (context) => AgencyDetailsScreen(),
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
            //           Text(
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
            //           builder: (context) => AgencyDetailsScreen(),
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
