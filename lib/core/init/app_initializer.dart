import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:waitwing/core/env/env.dart';

class AppInitializer {
  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Supabase.initialize(url: Env.supaBaseURL, anonKey: Env.supaBaseAnonKey);
  }
}
