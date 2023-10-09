import 'package:flutter/material.dart';

import 'package:quizzling/widgets/styled_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() {
    return _LoginFormState();
  }
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  bool _isObscured = true;
  String _userName = '';
  String _userPassword = '';

  void login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print(_userName);
      print(_userPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    const textFieldBorder = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    );

    return SingleChildScrollView(
      padding: const EdgeInsets.all(25),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 300,
              height: 70,
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                  floatingLabelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: textFieldBorder,
                  errorBorder: textFieldBorder,
                  focusedErrorBorder: textFieldBorder,
                  enabledBorder: textFieldBorder,
                ),
                style: const TextStyle(fontSize: 20),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (username) {
                  if (username == null || username.trim().isEmpty) {
                    return 'Username must be filled';
                  }
                  return null;
                },
                onSaved: (newUsername) {
                  _userName = newUsername!;
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured;
                      });
                    },
                    icon: Icon(
                      (_isObscured)
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: textFieldBorder,
                  errorBorder: textFieldBorder,
                  focusedErrorBorder: textFieldBorder,
                  enabledBorder: textFieldBorder,
                ),
                style: const TextStyle(fontSize: 20),
                autocorrect: false,
                obscureText: _isObscured,
                validator: (password) {
                  if (password == null || password.trim().isEmpty) {
                    return 'Password must be filled';
                  }
                  return null;
                },
                onSaved: (newPassword) {
                  _userPassword = newPassword!;
                },
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: TextButton(
                onPressed: () {},
                child: const Text('Forgot password',
                    style: TextStyle(color: Colors.black)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            //Custom styled button
            StyledButtton(onPressed: login),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                alignment: Alignment.center,
              ),
              child: const Text(
                'Don\'t have an account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
