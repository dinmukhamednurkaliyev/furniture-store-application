import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/core/providers/core_providers.dart';
import 'package:logging/logging.dart';

@immutable
final class ApplicationBootstrap {
  const ApplicationBootstrap._();

  static final _log = Logger('ApplicationBootstrap');

  static Future<void> run({
    required ProviderContainer container,
    required FutureOr<Widget> Function() applicationBuilder,
  }) async {
    // Ensure core services are initialized by reading their providers.
    // The .initialize() method for each service is called within its provider definition.
    container.read(loggingServiceProvider);
    final errorHandlerService = container.read(errorHandlerServiceProvider);
    container
      ..read(imageCacheServiceProvider)
      ..read(performanceMonitoringServiceProvider)
      ..read(memoryTrackingServiceProvider);

    await runZonedGuarded(
      () async {
        _log.info('Bootstrap complete. Running app...');
        runApp(await applicationBuilder());
      },
      errorHandlerService.handleZoneError,
    );
  }
}
