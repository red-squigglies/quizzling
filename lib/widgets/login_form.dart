import 'package:flutter/material.dart';
import 'package:quizzling/core/authentication.dart';
import 'package:quizzling/core/firebase_authentication.dart';
import 'package:quizzling/models/user_model.dart';
import 'package:quizzling/utils/vlad.dart';

import 'package:quizzling/widgets/quiz_button.dart';
import 'package:quizzling/widgets/quiz_password_field.dart';
import 'package:quizzling/widgets/quiz_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  var _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future<void> login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() {
      _isLoading = true;
    });

    try {
      Authentication auth = FirebaseAuthentication();

      final UserModel user = await auth.signIn(
        email: _emailController.text,
        password: _passwordController.text,
      );

      debugPrint(user.toString());

      // TODO: save the user.
      // TODO: navigate to home screen.
    } catch (e) {
      // TODO: handle the errors
      print(e);
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
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
              return Vlad(email)
                  .mandatory('Email is required')
                  .email('Please enter a valid email')
                  .error;
            },
          ),
          const SizedBox(height: 16),
          QuizPasswordField(
            labelText: 'Password',
            controller: _passwordController,
            validator: (password) {
              return Vlad(password)
                  .mandatory('Password is required')
                  .minLength(
                    6,
                    'The password must be at least 6 characters long',
                  )
                  .error;
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
            loading: _isLoading,
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
