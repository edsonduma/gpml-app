import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:stivy/utils/constants.dart';
import 'package:get_storage/get_storage.dart';
import 'package:stivy/utils/supabase_handler.dart';
import 'package:stivy/views/login_screen.dart';
import 'package:stivy/views/presentation_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyCustomAppBar extends StatelessWidget {
  // late SharedPreferences prefs;
  final SupaBaseHandler supaBaseHandler = SupaBaseHandler();

  MyCustomAppBar({super.key});

  // init() async {
  // Future<Widget> getMyContainer(context) async {
  // Future<Widget> getMyContainer(context) async {
  //   final prefs = await SharedPreferences.getInstance();

  //   return ;
  // }

  @override
  Widget build(BuildContext context) {
    // GetStorage box = GetStorage();
    // init();
    // prefs = await SharedPreferences.getInstance();
    // print("nome: ${box.read('nome')}");
    // AuthState authState = context.read<AuthState>();
    final session = supabase.auth.currentSession;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
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
        // (prefs.getString('nome') != '' || prefs.getString('nome') != null)
        // (box.read('nome') != '' || box.read('nome') != null)
        // (box.read('nome') != null)
        // (box.read('nome') != '' && box.read('nome') != null)

        session != null
            ? Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () async {
                    // box.remove('nome');
                    // await prefs.remove('nome');
                    // final prefs = await SharedPreferences.getInstance();
                    // await prefs.remove('nome');

                    supaBaseHandler.logout(context);

                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PresentationScreen(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    'logout',
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
            : Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          // const LoginScreen(pageFrom: 'admin'),
                          const LoginScreen(),
                    ),
                  ),
                  child: Text(
                    'login',
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 20,
                    ),
                  ),
                ),
              )
        // return getMyContainer(context),
        // if (prefs != null)
        // (prefs!.getString('kcnome') != '' || prefs!.getString('nome') != null)

        // if ((prefs = SharedPreferences.getInstance()) != null)

        // FutureBuilder<Widget>(
        //   future:
        //   builder: () => Container(),
        // ),
      ],
    );
  }
}
