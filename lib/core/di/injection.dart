import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
}

@module
abstract class ExternalDependenciesModule {
  @lazySingleton
  FirebaseApp get firebaseApp => Firebase.app();

  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;
}
