import 'package:queue_flow/core/secret/supabase_secrets.dart';

class SupabaseConfig {
  static const projectUrl = SupabaseSecrets.supabaseUrl;
  static const publishableKey = SupabaseSecrets.publishableKey;

  static void validate({String? projectUrl, String? publishableKey}) {
    final url = projectUrl ?? SupabaseConfig.projectUrl;
    final key = publishableKey ?? SupabaseConfig.publishableKey;

    if (url.isEmpty || key.trim().isEmpty) {
      throw StateError(
        'Missing Supabase configuration. Provide SUPABASE_URL and '
        'SUPABASE_PUBLISHABLE_KEY in the local secrets file.',
      );
    }

    final uri = Uri.tryParse(url);
    if (url != url.trim() ||
        uri == null ||
        uri.scheme != 'https' ||
        uri.host.isEmpty ||
        uri.userInfo.isNotEmpty ||
        (uri.path.isNotEmpty && uri.path != '/') ||
        uri.hasQuery ||
        uri.hasFragment) {
      throw StateError(
        'Invalid SUPABASE_URL. Provide an HTTPS base Project URL without '
        'a path, query, or fragment.',
      );
    }
  }
}
