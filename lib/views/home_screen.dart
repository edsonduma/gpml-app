import 'package:flutter/material.dart';
import 'package:stivy/models/designer.dart';
import 'package:stivy/models/makeup_artist.dart';
import 'package:stivy/models/model.dart';
import 'package:stivy/models/photographer.dart';
import 'package:stivy/models/stylist.dart';
import 'package:stivy/views/agencies/agency_create_screen.dart';
import 'package:stivy/views/designers/designers_create_screen.dart';
import 'package:stivy/views/designers/designers_details_screen.dart';
import 'package:stivy/views/makeup_artists/makeup_artists_create_screen.dart';
import 'package:stivy/views/makeup_artists/makeup_artists_details_screen.dart';
import 'package:stivy/views/models/models_create_screen.dart';
import 'package:stivy/views/models/models_details_screen.dart';
import 'package:stivy/views/photographers/photographers_create_screen.dart';
import 'package:stivy/views/photographers/photographers_details_screen.dart';
import 'package:stivy/views/stylists/stylists_create_screen.dart';
import 'package:stivy/views/stylists/stylists_details_screen.dart';
import 'package:stivy/models/agency.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/views/agencies/agency_details_screen.dart';
import 'package:stivy/views/components/my_custom_appbar.dart';
import 'package:stivy/widgets/card_view_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            Expanded(
              child: TabBarView(children: [
                // const Center(
                //   child: Text('Agências de Moda'),
                // ),
                // AgencyDisplayWidget(),
                CardViewWidget(
                  tableName: Agency.TABLE_NAME,
                  createScreen: const AgencyCreateScreen(),
                  detailsScreen: AgencyDetailsScreen(),
                ),
                // Center(
                //   child: Text(
                //     'Modelos free',
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //       backgroundColor: myForthColor,
                //     ),
                //   ),
                // ),
                CardViewWidget(
                  tableName: Model.TABLE_NAME,
                  createScreen: const ModelsCreateScreen(),
                  detailsScreen: ModelsDetailsScreen(),
                ),
                CardViewWidget(
                  tableName: Photographer.TABLE_NAME,
                  createScreen: const PhotographersCreateScreen(),
                  detailsScreen: PhotographersDetailsScreen(),
                ),
                CardViewWidget(
                  tableName: Designer.TABLE_NAME,
                  createScreen: const DesignersCreateScreen(),
                  detailsScreen: DesignersDetailsScreen(),
                ),
                CardViewWidget(
                  tableName: Stylist.TABLE_NAME,
                  createScreen: const StylistsCreateScreen(),
                  detailsScreen: StylistsDetailsScreen(),
                ),
                CardViewWidget(
                  tableName: MakeupArtist.TABLE_NAME,
                  createScreen: const MakeupArtistsCreateScreen(),
                  detailsScreen: MakeupArtistsDetailsScreen(),
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
