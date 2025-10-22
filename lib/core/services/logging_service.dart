import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

@immutable
class LoggingService {
  const LoggingService();

  static final _log = Logger('LoggingService');

  void initialize() {
    Logger.root.level = kDebugMode ? Level.ALL : Level.WARNING;

    Logger.root.onRecord.listen((record) {
      log(
        record.message,
        time: record.time,
        sequenceNumber: record.sequenceNumber,
        level: record.level.value,
        name: record.loggerName,
        zone: record.zone,
        error: record.error,
        stackTrace: record.stackTrace,
      );
    });
    _log.info('Logging initialized.');
  }
}
