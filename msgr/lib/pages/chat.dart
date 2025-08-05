import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/pages/profile.dart';

final supabase = Supabase.instance.client;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      switch (event) {
        case AuthChangeEvent.signedOut:
          Navigator.pushReplacementNamed(context, '/login');
        default:
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(children: <Widget>[Text("Chat")]),
      ),
    );
  }
}
