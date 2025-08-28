import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

@immutable
class ErrorHandlerService {
  const ErrorHandlerService();

  static final _log = Logger('ErrorHandler');

  void initialize() {
    FlutterError.onError = _handleFlutterError;

    PlatformDispatcher.instance.onError = (error, stack) {
      _logError(
        'Platform channel error',
        error,
        stack,
      );

      return true;
    };
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

  void _logError(String context, Object error, StackTrace? stackTrace) {
    _log.severe('$context: $error', error, stackTrace);
  }
}
