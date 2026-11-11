import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:queue_flow/core/di/injection.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() {
  tearDown(getIt.reset);

  test('registers shared Firebase and Supabase clients', () async {
    await configureDependencies();

    expect(getIt.isRegistered<FirebaseApp>(), isTrue);
    expect(getIt.isRegistered<SupabaseClient>(), isTrue);
  });
}
