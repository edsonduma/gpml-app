import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthStateOld with ChangeNotifier {
  final AuthChangeEvent changeEvent;
  final Session? session;

  AuthStateOld(this.changeEvent, this.session);
}
