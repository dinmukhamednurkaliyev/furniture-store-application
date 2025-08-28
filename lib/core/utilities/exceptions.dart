import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/core/core.dart';

/// A base class for all custom exceptions in the application.
///
/// Application exceptions are typically thrown by data sources (e.g., API clients)
/// and are caught by repositories, which then convert them into [ApplicationFailure] objects.
@immutable
base class ApplicationException implements Exception {
  const ApplicationException({
    this.message = 'An unexpected application error has occurred',
  });
  final String message;
}

/// An exception that indicates an error from the server.
@immutable
final class ServerException extends ApplicationException {
  const ServerException({required super.message, this.statusCode});

  /// The HTTP status code associated with the server error, if available.
  final int? statusCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerException &&
          message == other.message &&
          statusCode == other.statusCode;

  @override
  int get hashCode => Object.hash(message, statusCode);

  @override
  String toString() =>
      'ServerException(message: $message, statusCode: $statusCode)';
}

/// An exception that indicates an error with the local cache.
@immutable
final class CacheException extends ApplicationException {
  const CacheException({super.message = 'Cache exception occurred'});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheException && message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'CacheException(message: $message)';
}

/// An exception that indicates a network connectivity problem.
@immutable
final class NetworkException extends ApplicationException {
  const NetworkException({
    super.message = 'No Internet Connection exception occurred',
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkException && message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'NetworkException(message: $message)';
}
