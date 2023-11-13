import 'dart:math';

import 'package:flutter/material.dart';
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
              bottom: 20,
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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: items.length,
      child: Scaffold(
        backgroundColor: myForthColor,
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
                    flex: 1,
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
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        detailsScreen.setModel2(e),
                                  ),
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
                                        height: 150,
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
