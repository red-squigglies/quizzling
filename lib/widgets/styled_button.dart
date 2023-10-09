import 'package:flutter/material.dart';

class StyledButtton extends StatelessWidget {
  const StyledButtton({super.key, required this.onPressed});

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        fixedSize: const Size(300, 70),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
