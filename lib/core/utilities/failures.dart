import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/core/core.dart';

/// A base sealed class for representing different kinds of failures in the application.
///
/// Failures are used with the [Result] class to represent the error side of an operation.
@immutable
sealed class ApplicationFailure {
  /// Creates a [ApplicationFailure] with a given [message].
  const ApplicationFailure({required this.message});

  /// A descriptive message explaining the failure.
  final String message;
}

final class ServerFailure extends ApplicationFailure {
  const ServerFailure({required super.message, this.statusCode});

  /// The HTTP status code associated with the server error, if available.
  final int? statusCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ServerFailure &&
          message == other.message &&
          statusCode == other.statusCode;

  @override
  int get hashCode => Object.hash(message, statusCode);

  @override
  String toString() =>
      'ServerFailure(message: $message, statusCode: $statusCode)';
}

/// Represents a failure related to local cache (e.g., data not found).
final class CacheFailure extends ApplicationFailure {
  const CacheFailure({super.message = 'Cache Failure occurred'});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CacheFailure && message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'CacheFailure(message: $message)';
}

/// Represents a failure related to network connectivity.
final class NetworkFailure extends ApplicationFailure {
  const NetworkFailure({super.message = 'No internet connection'});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NetworkFailure && message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'NetworkFailure(message: $message)';
}

/// Represents an unexpected or unknown failure.
final class UnknownFailure extends ApplicationFailure {
  const UnknownFailure({super.message = 'An unexpected error occurred.'});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnknownFailure && message == other.message;

  @override
  int get hashCode => message.hashCode;

  @override
  String toString() => 'UnexpectedFailure(message: $message)';
}
