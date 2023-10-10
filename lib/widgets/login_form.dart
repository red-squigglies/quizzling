import 'package:flutter/material.dart';

import 'package:quizzling/widgets/quiz_button.dart';
import 'package:quizzling/widgets/quiz_password_field.dart';
import 'package:quizzling/widgets/quiz_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void login() {
    if (_formKey.currentState!.validate()) {
      // TODO: handle login
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuizTextField(
            labelText: 'Email',
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (email) {
              if (email == null || email.trim().isEmpty) {
                return 'Email is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          QuizPasswordField(
            labelText: 'Password',
            controller: _passwordController,
            validator: (password) {
              if (password == null || password.trim().isEmpty) {
                return 'Password is required';
              }
              return null;
            },
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: TextButton(
              onPressed: () {
                // TODO: navigate to reset password screen.
              },
              child: const Text(
                'Forgot password',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          const SizedBox(height: 12),
          QuizButton(
            onPressed: login,
            text: 'Login',
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {
              // TODO: navigate to sign up screen.
            },
            style: TextButton.styleFrom(
              alignment: Alignment.center,
            ),
            child: const Text(
              "Don't have an account",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
