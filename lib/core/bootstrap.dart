import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:logging/logging.dart';

@immutable
final class ApplicationBootstrap {
  const ApplicationBootstrap._();

  static final _log = Logger('ApplicationBootstrap');

  static Future<void> run({
    required FutureOr<Widget> Function() applicationBuilder,
  }) async {
    const loggingService = LoggingService();
    const errorHandlerService = ErrorHandlerService();
    const performanceMonitoringService = PerformanceMonitoringService();

    await runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        loggingService.initialize();
        errorHandlerService.initialize();

        if (kDebugMode) {
          performanceMonitoringService.initialize();
        }

        _log.info('Bootstrap complete. Running app...');
        runApp(await applicationBuilder());
      },
      errorHandlerService.handleZoneError,
    );
  }
}
