import 'package:flutter/material.dart';
import 'package:quizzling/widgets/quiz_text_field.dart';
import 'package:quizzling/widgets/toggle_password_icon.dart';

class QuizPasswordField extends StatefulWidget {
  const QuizPasswordField({
    super.key,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.validator,
    this.prefixIcon,
  });

  final String labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  State<QuizPasswordField> createState() => _QuizPasswordFieldState();
}

class _QuizPasswordFieldState extends State<QuizPasswordField> {
  bool _visible = false;

  void onToggle(bool visible) {
    setState(() {
      _visible = visible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return QuizTextField(
      labelText: widget.labelText,
      hintText: widget.hintText,
      prefixIcon: widget.prefixIcon,
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      validator: widget.validator,
      autocorrect: false,
      obscureText: !_visible,
      suffixIcon: TogglePasswordIcon(
        visible: _visible,
        onToggle: onToggle,
      ),
    );
  }
}
