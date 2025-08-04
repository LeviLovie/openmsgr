import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> initEnv() {
  return dotenv.load();
}

String get_key(String key) {
  String? value = dotenv.env[key];
  if (value == null) {
    throw Exception('Env value $key is null.');
  } else {
    return value;
  }
}

const KEY_SUPABASE_URL = "SUPABASE_URL";
const KEY_SUPABASE_ANON_KEY = "SUPABASE_ANON_KEY";
