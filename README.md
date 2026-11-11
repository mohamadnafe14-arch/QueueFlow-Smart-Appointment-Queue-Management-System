# QueueFlow

QueueFlow is a Flutter application foundation for appointment booking and
real-time queue management. The current app is a starter counter screen used to
exercise the shared foundation; customer, provider, and staff features have not
been implemented yet.

## Architecture

The application follows feature-first MVVM, with Cubit serving as the
ViewModel. There is no Domain layer. Feature-specific code will live under
`lib/features/<feature>/`, with each feature owning its `data/` and
`presentation/` layers. Shared infrastructure belongs under `lib/core/`.

Current structure:

```text
assets/fonts/                 Bundled Inter and JetBrains Mono fonts and licenses
lib/
  main.dart                   Startup and MaterialApp.router
  firebase_options.dart       Existing FlutterFire client options
  core/
    config/                   Supabase configuration validation
    di/                       GetIt + Injectable registration
    layout/                   Shared responsive breakpoints
    router/                   Named GoRouter routes and unknown-route handling
    secret/                   Local-only Supabase config; ignored by Git
    theme/                    Light/dark themes and design tokens
test/
  core/                       Config, DI, layout, router, and theme tests
  widget_test.dart            Root app and starter-screen smoke test
```

There are no feature modules, top-level `data/` directory, or top-level
`shared/` directory yet.

## Technologies

Runtime dependencies:

- Flutter and Material 3.
- `firebase_core` for Firebase initialization.
- `supabase_flutter` for Supabase Storage setup only; Supabase Database is not
  used.
- `get_it` and `injectable` for centralized dependency registration.
- `go_router` for centralized routing.

Development dependencies include `flutter_test`, `flutter_lints`,
`injectable_generator`, and `build_runner`. Fonts are bundled locally, so the
app does not fetch typography at runtime. Cubit, Firebase Auth, Firestore, and
FCM are not integrated yet.

## Setup

1. Install a Flutter SDK compatible with the Dart constraint in `pubspec.yaml`.
2. Obtain access to the existing Firebase and Supabase project configuration
   through the project owner or approved secret-management process.
3. Ensure the ignored local file `lib/core/secret/supabase_secrets.dart` exists
   and defines `SupabaseSecrets.supabaseUrl` and
   `SupabaseSecrets.publishableKey`. Use the HTTPS Supabase base Project URL,
   without `/rest/v1/`, and a Publishable Key only. The local file is required
   for compilation and is intentionally not tracked by Git.
4. Ensure the ignored Android file `android/app/google-services.json` is
   provisioned for the existing Firebase app. The Android Gradle configuration
   applies the Google Services plugin and needs that file to build.
5. Fetch package dependencies:

   ```powershell
   flutter pub get
   ```

`lib/firebase_options.dart` contains the existing Firebase client options.
Firebase Core is initialized using those options before Supabase and dependency
injection. Options are configured for Android, iOS, macOS, web, and Windows;
Linux is not configured. Firebase Auth, Firestore, and Messaging setup is
deferred to their feature work.

Never commit local configuration files, Supabase Secret/Service Role keys, or
other server credentials. Firebase client configuration is not an authorization
boundary; secure access with Firebase rules and service policies when those
services are implemented.

## Run and build

After completing setup:

```powershell
flutter run
flutter build apk --release
```

Supabase Storage operations and bucket policies are not implemented yet.

## Tests and checks

```powershell
flutter test
flutter analyze
dart format .
```

Tests use isolated validation inputs and do not connect to Firebase or
Supabase.

## Git workflow

Keep `main` as the stable branch and work on a separate `feature/<phase-or-feature>`
branch created from the latest approved `main`. Review and commit changes
explicitly; do not merge or delete branches automatically. The current work is
on `feature/foundation`.
