import 'package:flutter/foundation.dart';
import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';
import 'package:shared/shared.dart';

/// The AppLogger class provides a simple logging mechanism for the application.
@LazySingletonService()
class AppLogger {
  const AppLogger();

  /// Logs a message.
  void log(
    String message, {
    String? tag,
    bool prependDateTime = true,
  }) {
    logE(message);
    final sb = StringBuffer();

    if (prependDateTime) {
      sb.write('[${DateTime.now().toIso8601String()}] ');
    }

    if (tag != null) {
      sb.write('[$tag] ');
    }

    sb.write(message);

    if (kDebugMode) {
      print(sb);
    }
  }
}
