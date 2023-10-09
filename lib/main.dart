import 'package:flutter/material.dart';

import 'package:quizzling/screens/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzling',
      theme: ThemeData().copyWith(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: const Login(),
      ),
    );
  }
}
