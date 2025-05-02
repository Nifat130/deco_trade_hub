import 'package:logger/logger.dart';

//class PrettyPrinter extends LogPrinter {
//   static const topLeftCorner = '┌';
//   static const bottomLeftCorner = '└';
//   static const middleCorner = '├';
//   static const verticalLine = '│';
//   static const doubleDivider = '─';
//   static const singleDivider = '┄';
//
//   static final Map<Level, AnsiColor> defaultLevelColors = {
//     Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)),
//     Level.debug: const AnsiColor.none(),
//     Level.info: const AnsiColor.fg(12),
//     Level.warning: const AnsiColor.fg(208),
//     Level.error: const AnsiColor.fg(196),
//     Level.fatal: const AnsiColor.fg(199),
//   };
//
//   static final Map<Level, String> defaultLevelEmojis = {
//     Level.trace: '',
//     Level.debug: '🐛',
//     Level.info: '💡',
//     Level.warning: '⚠️',
//     Level.error: '⛔',
//     Level.fatal: '👾',
//   };
/// Initialize here main global [Logger] instance.
Logger _logger = Logger(
  level: Logger.level,
  printer: PrettyPrinter(
    levelColors: <Level, AnsiColor>{
      // Level.trace: AnsiColor.fg(AnsiColor.grey(0)), // Dark Grey
      Level.warning: const AnsiColor.fg(141), // Blue
      Level.debug: const AnsiColor.fg(208), // Blue
      Level.info: const AnsiColor.fg(80), //
      // 140 is purple
      // Level.warning: const AnsiColor.fg(3), // Yellow
      // Level.error: const AnsiColor.fg(1), // Red
      // Level.fatal: const AnsiColor.fg(1), // Red for fatal
    },
    methodCount: 1,
    excludePaths: <String>['package:shared/src/config/logger.dart'],
  ),
);

/// Log error method that used for printing out the error.
void logE(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.e(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Log warning that used for printing warning/important messages
/// to pay developer attention on it, rather than
/// using logI method.
void logW(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.w(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Log info method that used for printing info message.
void logI(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.i(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Log debug method to illustrate that the message is in debug mode
void logD(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.d(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Log a message at level [Level.trace].
void logT(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.t(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );

/// Log a message at level [Level.fatal].
void logF(
  dynamic message, {
  DateTime? time,
  Object? error,
  StackTrace? stackTrace,
}) =>
    _logger.f(
      message,
      time: time ?? DateTime.now(),
      error: error,
      stackTrace: stackTrace,
    );
