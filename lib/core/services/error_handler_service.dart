import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

@immutable
class ErrorHandlerService {
  const ErrorHandlerService();

  static final _log = Logger('ErrorHandler');

  void initialize() {
    FlutterError.onError = _handleFlutterError;

    PlatformDispatcher.instance.onError = _handlePlatformError;
    _log.info('Global error handlers set up.');
  }

  void handleZoneError(Object error, StackTrace stackTrace) {
    _logError('Zoned error', error, stackTrace);
  }

  void _handleFlutterError(FlutterErrorDetails details) {
    _logError(
      'Flutter framework error',
      details.exception,
      details.stack,
    );
  }

  bool _handlePlatformError(Object error, StackTrace stackTrace) {
    _logError(
      'Platform channel error',
      error,
      stackTrace,
    );

    return true;
  }

  void _logError(String context, Object error, StackTrace? stackTrace) {
    _log.severe('$context: $error', error, stackTrace);
  }
}
