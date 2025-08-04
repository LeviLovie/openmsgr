import 'package:supabase_flutter/supabase_flutter.dart';

import '/config.dart';

Future initSupabase() async {
  await Supabase.initialize(
    url: get_key(KEY_SUPABASE_URL),
    anonKey: get_key(KEY_SUPABASE_ANON_KEY),
  );
}
