import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

class MemoryTrackingService {
  const MemoryTrackingService();

  static final _log = Logger('MemoryTrackingService');
  static bool _isEnabled = false;

  void initialize() {
    _isEnabled = true;
    _log.info('Memory tracking service enabled.');
  }

  static void logMemoryUsage(String tag) {
    if (!_isEnabled) {
      return;
    }

    if (!kIsWeb) {
      final rssBytes = ProcessInfo.currentRss;

      final usageMB = (rssBytes / 1024 / 1024).toStringAsFixed(2);

      _log.fine('Memory Usage [$tag]: $usageMB MB');
    }
  }
}
