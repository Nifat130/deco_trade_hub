// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:deco_trade_hub/blocs/app_meta_data_cubit/app_meta_data_cubit.dart'
    as _i962;
import 'package:deco_trade_hub/blocs/localization_cubit/localization_cubit.dart'
    as _i828;
import 'package:deco_trade_hub/blocs/theme_cubit/theme_cubit.dart' as _i488;
import 'package:deco_trade_hub/features/store/presentation/shared/bloc/store_form/store_form_bloc.dart'
    as _i1057;
import 'package:deco_trade_hub/features/store/repository/store_repository.dart'
    as _i719;
import 'package:deco_trade_hub/features/store/repository/store_repository_impl.dart'
    as _i768;
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart'
    as _i203;
import 'package:deco_trade_hub/services/logger/app_logger.dart' as _i258;
import 'package:deco_trade_hub/services/logger/error_logger.dart' as _i89;
import 'package:deco_trade_hub/services/logger/event_logger.dart' as _i1066;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initInjectable(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i89.ErrorLogger>(() => const _i89.ErrorLogger());
  gh.lazySingleton<_i258.AppLogger>(() => const _i258.AppLogger());
  gh.lazySingleton<_i1066.EventLogger>(() => const _i1066.EventLogger());
  gh.lazySingleton<_i488.ThemeCubit>(() => _i488.ThemeCubit());
  gh.lazySingleton<_i828.LocalizationCubit>(() => _i828.LocalizationCubit());
  gh.factory<int>(
    () => registerModule.incrementValue,
    instanceName: 'increment_value',
  );
  gh.lazySingleton<_i719.StoreRepository>(
      () => _i768.StoreRepositoryImpl(gh<_i454.SupabaseClient>()));
  gh.lazySingleton<_i962.AppMetaDataCubit>(() => _i962.AppMetaDataCubit(
        gh<_i258.AppLogger>(),
        gh<_i89.ErrorLogger>(),
      ));
  gh.factory<_i1057.StoreFormBloc>(
      () => _i1057.StoreFormBloc(gh<_i719.StoreRepository>()));
  return getIt;
}

class _$RegisterModule extends _i203.RegisterModule {}
