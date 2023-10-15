import 'package:flutter/material.dart';

import 'package:quizzling/widgets/login_form.dart';
import 'package:quizzling/widgets/quiz_app_bar.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: QuizAppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 125,
              ),
              const SizedBox(height: 64),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
