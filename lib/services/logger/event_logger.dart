import 'package:deco_trade_hub/services/dependencies/src/dependency_injection.dart';

/// A singleton class that handles event logging.
@LazySingletonService()
class EventLogger {
  const EventLogger();

  /// Logs the given event into the reporting system.
  Future<void> recordEvent({
    required String message,
    EventLoggerLevel? level,
    StackTrace? stackTrace,
  }) async {
    // TODO(msi): Implement this method to log events in your chosen
    // reporting system.
  }
}

/// The level of an event that will be recorded by the [EventLogger]
enum EventLoggerLevel {
  debug,
  info,
  error,
}
