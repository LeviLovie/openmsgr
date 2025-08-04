import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '/pages/profile.dart';

final supabase = Supabase.instance.client;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email = '';
  String _password = '';

  String _error = '';

  @override
  void initState() {
    _setupAuthListener();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _setupAuthListener() {
    supabase.auth.onAuthStateChange.listen((data) {
      final event = data.event;
      switch (event) {
        case AuthChangeEvent.signedIn:
          Navigator.pushReplacementNamed(context, '/chat');
        default:
      }
    });
  }

  void _signup() async {
    try {
      final AuthResponse res = await supabase.auth.signUp(
        email: _email,
        password: _password,
      );
      if (res.user != null) {
        Navigator.pushReplacementNamed(context, '/chat');
      }
    } on AuthException catch (e) {
      String message = e.message;
      setState(() {
        _error = message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Signup')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Text('Already have an account?'),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
            const SizedBox(height: 4),

            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              onChanged: (email) {
                setState(() {
                  _email = email;
                });
              },
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              onChanged: (password) {
                setState(() {
                  _password = password;
                });
              },
            ),
            const SizedBox(height: 24),

            Text(_error),
            const SizedBox(height: 4),

            ElevatedButton(onPressed: _signup, child: const Text('Signup')),
          ],
        ),
      ),
    );
  }
}
