# QueueFlow

## Run locally

Provide the Supabase base Project URL and Publishable Key using Dart defines.
Use the project URL without `/rest/v1/`. For example:

```powershell
flutter run --dart-define=SUPABASE_URL=https://hiekwcvtfsxitnstpwjn.supabase.co --dart-define=SUPABASE_PUBLISHABLE_KEY=sb_publishable_your-key
```

## Build

Pass the same defines to every build:

```powershell
flutter build apk --release --dart-define=SUPABASE_URL=https://hiekwcvtfsxitnstpwjn.supabase.co --dart-define=SUPABASE_PUBLISHABLE_KEY=sb_publishable_your-key
```

The Project URL above is the confirmed base URL. Replace the example
Publishable Key with the key supplied for local use. Startup fails with a safe
configuration error if either value is missing or the URL is invalid.

The Publishable Key is intended for client applications, but Dart defines are
compiled into the app and are not a way to store secrets. Never provide a
Supabase Secret or Service Role key. Supabase is used for Storage only; the
application does not use Supabase Database.
