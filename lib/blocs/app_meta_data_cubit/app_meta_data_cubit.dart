import 'dart:async';
import 'dart:io';

import 'package:android_id/android_id.dart';
import 'package:bloc/bloc.dart';
import 'package:deco_trade_hub/core/di/get_it_di.dart';
import 'package:deco_trade_hub/services/global/enums.dart';
import 'package:deco_trade_hub/services/logger/app_logger.dart';
import 'package:deco_trade_hub/services/logger/error_logger.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:persistent_storage/persistent_storage.dart';
import 'package:shared/shared.dart';

part 'app_meta_data_state.dart';

class AppMetaDataCubit extends Cubit<AppMetaDataState> {
  AppMetaDataCubit(
    this._logger,
    this._errorLogger,
  ) : super(const AppMetaDataInitial());

  final AppLogger _logger;
  final ErrorLogger _errorLogger;

  static const String _tag = 'AppMetaDataCubit';

  Completer<void>? _initCompleter;

  Future<void> init() async {
    if (_initCompleter == null) {
      _initCompleter = Completer<void>();
      unawaited(_init());
    }
    return _initCompleter!.future;
  }

  Future<void> _init() async {
    emit(const AppMetaDataLoading());

    try {
      final deviceId = await _getDeviceId();
      final osType = Platform.operatingSystem;
      final osVersion = Platform.operatingSystemVersion;

      final packageInfo = await PackageInfo.fromPlatform();
      final appVersion = packageInfo.version;
      final buildNumber = packageInfo.buildNumber;

      final storage = manualSl.get<PersistentStorage>();
      final isFirstTimer = await storage.read(
        key: StorageKeys.isFirstTimer.keyString,
      );

      logE('isFirstTimer: $isFirstTimer');

      emit(
        AppMetaDataLoaded(
          deviceId: deviceId ?? '',
          osType: osType,
          osVersion: osVersion,
          appVersion: appVersion,
          buildNumber: buildNumber,
          isFirstTimer: isFirstTimer,
        ),
      );
    } catch (error, stackTrace) {
      _logger.log(
        'Error while initializing AppMetaDataCubit: $error',
        tag: _tag,
      );

      // Report the error using ErrorLogger
      await _errorLogger.recordError(error: error, stackTrace: stackTrace);

      emit(AppMetaDataLoadingFailed(error: error, stackTrace: stackTrace));
    } finally {
      _initCompleter!.complete();
      _initCompleter = null;
    }
  }

  Future<String?> _getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      return (await deviceInfo.iosInfo).identifierForVendor;
    } else if (Platform.isAndroid) {
      return const AndroidId().getId();
    } else {
      return null;
    }
  }
}
