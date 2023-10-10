import 'package:flutter/material.dart';

class QuizAppBar extends AppBar {
  QuizAppBar({super.key, super.title})
      : super(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
          leading: const QuizBackButton(),
        );
}

class QuizBackButton extends StatelessWidget {
  const QuizBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Navigator.of(context).canPop()) {
      return const SizedBox.shrink();
    }

    return IconButton(
      onPressed: Navigator.of(context).pop,
      icon: const Icon(Icons.arrow_back_ios),
      color: Colors.black,
    );
  }
}
