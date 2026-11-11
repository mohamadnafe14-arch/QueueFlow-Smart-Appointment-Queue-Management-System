// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:queue_flow/core/di/injection.dart' as _i1;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final externalDependenciesModule = _$ExternalDependenciesModule();
    gh.lazySingleton<_i982.FirebaseApp>(
      () => externalDependenciesModule.firebaseApp,
    );
    gh.lazySingleton<_i454.SupabaseClient>(
      () => externalDependenciesModule.supabaseClient,
    );
    return this;
  }
}

class _$ExternalDependenciesModule extends _i1.ExternalDependenciesModule {}
