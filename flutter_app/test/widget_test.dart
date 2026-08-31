// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_app/app/app.dart';

void main() {
  testWidgets('app starts on the login screen', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());
    addTearDown(() => tester.view.resetDevicePixelRatio());

    await tester.pumpWidget(const App());

    expect(find.text('Login'), findsOneWidget);
    expect(
      find.text('READY FOR A SURPRISE? SIGN IN TO YOUR ACCOUNT'),
      findsNothing,
    );
    expect(find.text('LOGIN'), findsOneWidget);
  });

  testWidgets('login leads to match form and result screen', (
    WidgetTester tester,
  ) async {
    tester.view.physicalSize = const Size(800, 1200);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());
    addTearDown(() => tester.view.resetDevicePixelRatio());

    await tester.pumpWidget(const App());

    await tester.tap(find.text('LOGIN'));
    await tester.pumpAndSettle();

    expect(find.text('Welcome to Match App'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));

    await tester.enterText(find.byType(TextFormField).at(0), 'Aisha');
    await tester.enterText(find.byType(TextFormField).at(1), 'Ali');
    await tester.tap(find.text('Check Match'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));
    await tester.pumpAndSettle();

    expect(find.text('Made for Each Other...!!!!'), findsOneWidget);
  });
}
