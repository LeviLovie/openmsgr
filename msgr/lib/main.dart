import 'package:flutter/material.dart';

import '/config.dart';
import '/pages/chat.dart';
import '/pages/login.dart';
import '/pages/signup.dart';
import '/auth/supabase.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  '/chat': (BuildContext context) => const ChatPage(),
  '/login': (BuildContext context) => const LoginPage(),
  '/signup': (BuildContext context) => const SignupPage(),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initEnv();
  await initSupabase();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messenger',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
      routes: routes,
    );
  }
}
