import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {
  const QuizButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.disabled = false,
    this.loading = false,
  });

  final void Function() onPressed;
  final String text;
  final bool disabled;
  final bool loading;

  void handlePress() {
    if (!loading) onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ElevatedButton(
        onPressed: disabled ? null : handlePress,
        style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        child: loading
            ? const SizedBox(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(color: Colors.white),
              )
            : Text(
                text,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
      ),
    );
  }
}
