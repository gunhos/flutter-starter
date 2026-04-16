import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutterstarter/features/auth/presentation/login_screen.dart';
import 'package:flutterstarter/features/auth/presentation/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  testWidgets('LoginScreen shows sign-in button', (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          authStateProvider.overrideWith(
            (ref) => Stream<User?>.value(null),
          ),
        ],
        child: const MaterialApp(home: LoginScreen()),
      ),
    );
    await tester.pump();
    expect(find.text('Sign in with Google'), findsOneWidget);
  });
}
