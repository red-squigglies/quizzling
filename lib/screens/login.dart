import 'package:flutter/material.dart';

import 'package:quizzling/widgets/login_form.dart';

class Login extends StatelessWidget {
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextButton.icon(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {},
          label: const Text(
            'Login',
            style: TextStyle(
                color: Colors.black,
                fontSize: 21.5,
                fontWeight: FontWeight.normal),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoginForm(),
        ],
      ),
    );
  }
}
