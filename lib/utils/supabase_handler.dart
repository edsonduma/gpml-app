import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SupaBaseHandler with ChangeNotifier {
  register({
    required String email,
    required String password,
  }) async {
    // Email and password sign up
    final result = await supabase.auth.signUp(
      email: email,
      password: password,
    );

    debugPrint(result.user!.toJson().toString());
  }

  login({
    required String email,
    required String password,
  }) async {
// Email and password login
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      debugPrint(response.toString());
      print('error result: ' + response.toString());

      // return response is AuthResponse;
      return true;
    } catch (error) {
      debugPrint(error.toString());
      print('error result: ' + error.toString());

      return false;
    }
  }

  loginWithMagicLink({required String email}) async {
// Magic link login
    // await supabase.auth.signInWithOtp(email: 'my_email@example.com');
    await supabase.auth.signInWithOtp(email: email);
  }

  authStateChanges() {
    Session? mySession;

// Listen to auth state changes
    supabase.auth.onAuthStateChange.listen((data) {
      final AuthChangeEvent event = data.event;
      final Session? session = data.session;
      // Do something when there is an auth event

      mySession = session;
    });

    return mySession;
  }

  logout(context) async {
    await supabase.auth.signOut();
    // Navigator.pushReplacementNamed(context, 'login');
  }

  addData(
    String table,
    Map<String, dynamic> row,
    context,
  ) async {
    try {
      await supabase.from(table).upsert(row);

      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       Text('Saved the $table'),
      //       Icon(Icons.done),
      //     ],
      //   ),
      //   backgroundColor: Colors.green[700],
      // ));
    } catch (e) {
      print("error: $e");

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error saving $table'),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<List?> readData(
    String table,
    context,
  ) async {
    // var response = await client.from("todotable").select().order('task', ascending: true).execute();
    print('Read Data');
    try {
      var response = await supabase.from(table).select();
      print('Response Data ${response}');
      final dataList = response as List;
      return dataList;
    } catch (e) {
      print('Response Error ${e}');
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Error occured while getting Data'),
        backgroundColor: Colors.red,
      ));
      return null;
    }
  }

  updateData(
    String table,
    Map<String, dynamic> row,
  ) async {
    await supabase.from(table).upsert(row);
  }

  deleteData(
    String table,
    int id,
  ) async {
    await supabase.from(table).delete().match({'id': id});
  }
}
