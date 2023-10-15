import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:quizzling/config/firebase_options.dart';
import 'package:quizzling/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const QuizzlingApp());
}

class QuizzlingApp extends StatelessWidget {
  const QuizzlingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizzling',
      theme: Theme.of(context).copyWith(scaffoldBackgroundColor: Colors.white),
      home: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: const Login(),
      ),
    );
  }
}
