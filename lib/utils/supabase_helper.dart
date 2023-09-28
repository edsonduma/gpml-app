import 'package:supabase_flutter/supabase_flutter.dart';

final supabase = Supabase.instance.client;

class SupabaseHelper {
  static const _SUPABASE_URL = "https://exxpmoqjawdpxjogykvc.supabase.co";
  static const _SUPABASE_KEY =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV4eHBtb3FqYXdkcHhqb2d5a3ZjIiwicm9sZSI6ImFub24iLCJpYXQiOjE2OTU4NTM3NjksImV4cCI6MjAxMTQyOTc2OX0.kRXllIxDtIoK1hqzfzUH_tUx8YHrTb-4Uil5K3Ltgo8";

  static Future<void> init() async {
    await Supabase.initialize(url: _SUPABASE_URL, anonKey: _SUPABASE_KEY);
  }

  static Future<void> insert(String table, Map<String, dynamic> row) async {
// Insert a new row
    await supabase.from(table).insert(row);
  }

  static Future<dynamic> getAllList(String table) async {
    // Select data with filters
    final data = await supabase.from(table).select();
    return data;
  }
}
