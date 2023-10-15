import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quizzling/widgets/toggle_password_icon.dart';

void main() {
  testWidgets('TogglePasswordIcon toggles the visible value when tapped',
      (tester) async {
    const visible = false;
    final completer = Completer<bool>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TogglePasswordIcon(
            visible: visible,
            onToggle: completer.complete,
          ),
        ),
      ),
    );

    await tester.tap(find.byType(IconButton));

    expect(completer.isCompleted, isTrue);
    expect(await completer.future, !visible);
  });

  testWidgets(
      'TogglePasswordIcon shows an accessible tooltip for hiding password',
      (tester) async {
    const visible = true;
    final completer = Completer<bool>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TogglePasswordIcon(
            visible: visible,
            onToggle: completer.complete,
          ),
        ),
      ),
    );

    expect(find.byTooltip('Hide Password'), findsOneWidget);
    expect(find.byTooltip('Show Password'), findsNothing);
  });

  testWidgets(
      'TogglePasswordIcon shows an accessible tooltip for showing password',
      (tester) async {
    const visible = false;
    final completer = Completer<bool>();

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TogglePasswordIcon(
            visible: visible,
            onToggle: completer.complete,
          ),
        ),
      ),
    );

    expect(find.byTooltip('Show Password'), findsOneWidget);
    expect(find.byTooltip('Hide Password'), findsNothing);
  });
}
