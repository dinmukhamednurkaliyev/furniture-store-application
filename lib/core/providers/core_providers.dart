import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/services/error_handler_service.dart';
import 'package:furniture_store_application/core/services/image_cache_service.dart';
import 'package:furniture_store_application/core/services/logging_service.dart';
import 'package:furniture_store_application/core/services/memory_tracking_service.dart';
import 'package:furniture_store_application/core/services/performance_monitoring_service.dart';

/// Provides an instance of [LoggingService].
final loggingServiceProvider = Provider<LoggingService>((ref) {
  final service = const LoggingService()..initialize();
  return service;
});

/// Provides an instance of [ErrorHandlerService].
final errorHandlerServiceProvider = Provider<ErrorHandlerService>((ref) {
  final service = const ErrorHandlerService()..initialize();
  return service;
});

/// Provides an instance of [ImageCacheService].
final imageCacheServiceProvider = Provider<ImageCacheService>((ref) {
  final service = const ImageCacheService()..initialize();
  return service;
});

/// Provides an instance of [PerformanceMonitoringService].
final performanceMonitoringServiceProvider =
    Provider<PerformanceMonitoringService>((ref) {
      final service = const PerformanceMonitoringService()..initialize();
      return service;
    });

/// Provides an instance of [MemoryTrackingService].
final memoryTrackingServiceProvider = Provider<MemoryTrackingService>((ref) {
  final service = const MemoryTrackingService()..initialize();
  return service;
});
