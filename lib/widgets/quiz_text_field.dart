import 'package:flutter/material.dart';

class QuizTextField extends StatelessWidget {
  const QuizTextField({
    super.key,
    required this.labelText,
    this.hintText,
    this.keyboardType,
    this.controller,
    this.autocorrect = true,
    this.obscureText = false,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
  });

  final String labelText;
  final String? hintText;
  final bool autocorrect;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  final _border = const OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.black,
      width: 2,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        floatingLabelStyle: const TextStyle(color: Colors.black),
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: _border,
        errorBorder: _border,
        focusedErrorBorder: _border,
        enabledBorder: _border,
      ),
      keyboardType: keyboardType,
      autocorrect: autocorrect,
      obscureText: obscureText,
      validator: validator,
    );
  }
}
