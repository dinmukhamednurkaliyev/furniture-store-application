import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

@immutable
class PerformanceMonitoringService {
  const PerformanceMonitoringService();

  static final _log = Logger('PerformanceMonitor');

  void initialize() {
    const maxFrameTime = Duration(milliseconds: 17);

    WidgetsBinding.instance.addTimingsCallback((timings) {
      for (final timing in timings) {
        if (timing.totalSpan > maxFrameTime) {
          _log.warning(
            'Janky frame detected! '
            'Took ${timing.totalSpan.inMilliseconds}ms to render.',
          );
        }
      }
    });
    _log.info('Frame performance monitor enabled.');
  }
}
