import 'package:flutter/material.dart';

class TogglePasswordIcon extends StatelessWidget {
  const TogglePasswordIcon({
    super.key,
    required this.visible,
    required this.onToggle,
  });

  final bool visible;
  final void Function(bool visible) onToggle;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => onToggle(!visible),
      icon: Icon(
        visible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: Colors.black,
      ),
    );
  }
}
