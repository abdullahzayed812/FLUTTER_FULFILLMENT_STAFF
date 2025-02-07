// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i6;
import 'package:postage_staff/core/app/app_cubit/app_cubit.dart' as _i3;
import 'package:postage_staff/core/data/services/api_services/injectable_module.dart'
    as _i7;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectableModule = _$InjectableModule();
    gh.factory<_i3.AppCubit>(() => _i3.AppCubit());
    await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => injectableModule.sharedPref,
      preResolve: true,
    );
    gh.lazySingleton<_i5.Dio>(() => injectableModule.dioInstance);
    gh.lazySingleton<_i6.Logger>(() => injectableModule.logger);
    return this;
  }
}

class _$InjectableModule extends _i7.InjectableModule {}
