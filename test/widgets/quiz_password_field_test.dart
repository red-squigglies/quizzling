import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quizzling/widgets/quiz_password_field.dart';

void main() {
  testWidgets(
      'QuizPasswordField should show/hide the password when icon pressed',
      (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: QuizPasswordField(
            labelText: "Password",
          ),
        ),
      ),
    );

    final finder = find.byType(TextField);

    expect(
      tester.firstWidget<TextField>(finder).obscureText,
      isTrue,
    );

    await tester.tap(find.byType(IconButton));

    await tester.pumpAndSettle();

    expect(
      tester.firstWidget<TextField>(finder).obscureText,
      isFalse,
    );
  });
}
