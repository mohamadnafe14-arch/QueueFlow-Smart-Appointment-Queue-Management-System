import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_flow/core/router/app_router.dart';

void main() {
  testWidgets('resolves the named home route', (tester) async {
    final router = createAppRouter(home: const Text('Home destination'));
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Home destination'), findsOneWidget);
    expect(router.namedLocation(AppRouteNames.home), AppRoutePaths.home);
  });

  testWidgets('shows an unknown-route page and can return home', (
    tester,
  ) async {
    final router = createAppRouter(
      home: const Text('Home destination'),
      initialLocation: '/unknown',
    );
    addTearDown(router.dispose);

    await tester.pumpWidget(MaterialApp.router(routerConfig: router));
    await tester.pumpAndSettle();

    expect(find.text('Page not found'), findsOneWidget);
    await tester.tap(find.text('Go home'));
    await tester.pumpAndSettle();
    expect(find.text('Home destination'), findsOneWidget);
  });
}
