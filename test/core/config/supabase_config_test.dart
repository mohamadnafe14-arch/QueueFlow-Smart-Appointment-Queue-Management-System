import 'package:flutter_test/flutter_test.dart';
import 'package:queue_flow/core/config/supabase_config.dart';

void main() {
  group('SupabaseConfig.validate', () {
    const publishableKey = 'sb_publishable_test-key';
    const projectUrl = 'https://project.supabase.co';

    test('accepts a valid base project URL', () {
      SupabaseConfig.validate(
        projectUrl: projectUrl,
        publishableKey: publishableKey,
      );
    });

    test('rejects a missing project URL', () {
      expect(
        () => SupabaseConfig.validate(
          projectUrl: '',
          publishableKey: publishableKey,
        ),
        throwsA(
          isA<StateError>().having(
            (error) => error.message,
            'message',
            contains('Missing Supabase configuration'),
          ),
        ),
      );
    });

    test('rejects a missing publishable key', () {
      expect(
        () =>
            SupabaseConfig.validate(projectUrl: projectUrl, publishableKey: ''),
        throwsA(
          isA<StateError>().having(
            (error) => error.message,
            'message',
            contains('Missing Supabase configuration'),
          ),
        ),
      );
    });

    test('rejects URLs with a path', () {
      expect(
        () => SupabaseConfig.validate(
          projectUrl: '$projectUrl/rest/v1/',
          publishableKey: publishableKey,
        ),
        throwsA(
          isA<StateError>().having(
            (error) => error.message,
            'message',
            contains('Invalid SUPABASE_URL'),
          ),
        ),
      );
    });

    test('rejects non-HTTPS URLs', () {
      expect(
        () => SupabaseConfig.validate(
          projectUrl: 'http://project.supabase.co',
          publishableKey: publishableKey,
        ),
        throwsA(
          isA<StateError>().having(
            (error) => error.message,
            'message',
            contains('Invalid SUPABASE_URL'),
          ),
        ),
      );
    });
  });
}
