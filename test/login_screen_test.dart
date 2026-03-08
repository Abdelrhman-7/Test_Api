import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/view/screen/login_screen.dart';
import 'package:flutter_application_1/models/model/response_api.dart';

void main() {
  testWidgets('LoginScreen renders without infinite height layout exception', (
    WidgetTester tester,
  ) async {
    // Build LoginScreen.
    await tester.pumpWidget(const MaterialApp(home: LoginScreen()));

    // If we reach here without an exception, the fix is likely working.
    expect(find.text("Login Screen"), findsOneWidget);
    expect(
      find.text("Login"),
      findsNothing,
    ); // It's in CustomRegisterButton now
    expect(find.text("login"), findsOneWidget);
  });
}
