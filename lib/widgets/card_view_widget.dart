import 'package:flutter/material.dart';

import 'dart:math';

// import 'package:stivy/models/agency.dart';
import 'package:stivy/utils/constants.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/views/models/abstract_screen_model.dart';
// import 'package:stivy/views/agencies/agency_create_screen.dart';
// import 'package:stivy/views/agencies/agency_details_screen.dart';

class CardViewWidget extends StatefulWidget {
  final String tableName;
  final Widget createScreen;
  final AbstractScreenModel detailsScreen;

  const CardViewWidget({
    super.key,
    required this.tableName,
    required this.createScreen,
    required this.detailsScreen,
  });

  @override
  State<CardViewWidget> createState() => _CardViewWidgetState();
}

class _CardViewWidgetState extends State<CardViewWidget> {
  Widget get createScreen => widget.createScreen;
  AbstractScreenModel get detailsScreen => widget.detailsScreen;

  late SupaBaseHandler supaBaseHandler = SupaBaseHandler();
  late List items = [];
  late List? listOfData = [];
  final _random = Random();

  @override
  void initState() {
    super.initState();

    getAllDatas();
  }

  int randomNumber(int min, int max) => min + _random.nextInt(max - min);

  Future getAllDatas() async {
    setState(() => items = []);

    listOfData = await supaBaseHandler.readData(widget.tableName, context);

    List tempItems = [];

    for (var item in listOfData!) {
      tempItems.add(item);
    }

    setState(() => items.addAll(tempItems));

    return Future.value(listOfData);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        // backgroundColor: myForthColor,
        floatingActionButton: supabase.auth.currentSession == null
            ? null
            : FloatingActionButton(
                backgroundColor: secondColor,
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => createScreen,
                  ),
                ),
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
                    flex: 3,
                    child: TabBarView(
                      children: items
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(
                                top: 20.0,
                                bottom: 0,
                                left: 150.0,
                                right: 150.0,
                              ),
                              child: InkWell(
                                onTap: () {
                                  detailsScreen.setModel2(e);

                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => detailsScreen,
                                    ),
                                  );
                                },
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                  child: Container(
                                    color: Colors.black,
                                    child: Image(
                                      image: AssetImage(
                                          'assets/images/models/foto0${randomNumber(1, 7)}.jpg'),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    flex: 1,
                    child: TabBar(
                        isScrollable: true,
                        tabs: items
                            .map(
                              (element) => Column(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                    child: Container(
                                      color: Colors.black,
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/models/foto0${randomNumber(1, 7)}.jpg'),
                                        // height: 100,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                  Text(element['nome']),
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ],
              ),
      ),
    );
  }
}
