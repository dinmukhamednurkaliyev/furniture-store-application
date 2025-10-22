import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

@immutable
class MemoryTrackingService {
  const MemoryTrackingService();

  static final _log = Logger('MemoryTrackingService');

  void initialize() {
    _log.info('Memory tracking service enabled.');
    Timer.periodic(const Duration(seconds: 30), (timer) {
      _logMemoryUsage('periodic');
    });
  }

  void _logMemoryUsage(String tag) {
    if (!kIsWeb) {
      final rssBytes = ProcessInfo.currentRss;
      final usageMB = (rssBytes / 1024 / 1024).toStringAsFixed(2);
      _log.info('Memory Usage [$tag]: $usageMB MB');
    }
  }
}
