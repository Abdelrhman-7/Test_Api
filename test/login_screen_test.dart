import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/view/screen/login_screen.dart';
import 'package:flutter_application_1/data_layer/model/response_api.dart';

void main() {
  testWidgets('LoginScreen renders without infinite height layout exception', (
    WidgetTester tester,
  ) async {
    // Create a dummy response.
    final dummyResponse = ResponseApi(info: Info(name: ""));

    // Build LoginScreen.
    await tester.pumpWidget(
      MaterialApp(home: LoginScreen(response: dummyResponse)),
    );

    // If we reach here without an exception, the fix is likely working.
    expect(find.text("login screen"), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.text("login"), findsOneWidget);
  });
}
