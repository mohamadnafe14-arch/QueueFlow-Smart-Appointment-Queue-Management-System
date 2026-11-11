# QueueFlow

## Run locally

Supabase configuration is read from the ignored local file
`lib/core/secret/supabase_secrets.dart`. Keep its URL set to the base Project
URL (without `/rest/v1/`) and use only a Publishable Key. Never place a Secret
or Service Role key in the Flutter app.

```powershell
flutter run
```

## Build

```powershell
flutter build apk --release
```

Supabase uses Storage only; the application does not use Supabase Database.
