import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRoutePaths {
  static const home = '/';
}

class AppRouteNames {
  static const home = 'home';
}

GoRouter createAppRouter({
  required Widget home,
  String initialLocation = AppRoutePaths.home,
}) {
  return GoRouter(
    initialLocation: initialLocation,
    routes: [
      GoRoute(
        path: AppRoutePaths.home,
        name: AppRouteNames.home,
        builder: (context, state) => home,
      ),
    ],
    errorBuilder: (context, state) => const _UnknownRoutePage(),
  );
}

class _UnknownRoutePage extends StatelessWidget {
  const _UnknownRoutePage();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.link_off,
                color: colorScheme.onSurfaceVariant,
                size: 40,
              ),
              const SizedBox(height: 16),
              Text(
                'Page not found',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 8),
              Text(
                'The requested page does not exist.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => context.goNamed(AppRouteNames.home),
                child: const Text('Go home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
