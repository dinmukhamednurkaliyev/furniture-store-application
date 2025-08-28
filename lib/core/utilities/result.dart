import 'package:flutter/widgets.dart';
import 'package:furniture_store_application/core/core.dart';

/// A sealed class representing the result of an operation that can either
/// succeed with a value of type [T] or fail with a [ApplicationFailure].
///
/// This approach is preferred over throwing exceptions for predictable errors,
/// as it forces the caller to handle both success and failure states.
@immutable
sealed class Result<T> {
  /// Creates a const [Result].
  const Result();

  /// Returns `true` if this is a [Success] instance.
  bool get isSuccess => this is Success<T>;

  /// Returns `true` if this is an [Error] instance.
  bool get isError => this is Error<T>;

  /// Returns the encapsulated value if this is a [Success], or the result of
  /// [orElse] if this is an [Error].
  T getOrElse(T orElse) {
    return switch (this) {
      Success(data: final d) => d,
      Error() => orElse,
    };
  }

  /// Transforms the encapsulated value if this is a [Success], otherwise
  /// returns the [Error].
  Result<R> map<R>(R Function(T data) f) {
    return switch (this) {
      Success(data: final d) => Success(f(d)),
      Error(failure: final f) => Error(f),
    };
  }

  /// Binds the encapsulated value to a new [Result] if this is a [Success],
  /// otherwise returns the [Error]. Useful for chaining operations that
  /// return a [Result].
  Result<R> flatMap<R>(Result<R> Function(T data) f) {
    return switch (this) {
      Success(data: final d) => f(d),
      Error(failure: final f) => Error(f),
    };
  }

  /// Handles the two cases of [Result]: [success] for [Success] and [error]
  /// for [Error]. This provides an exhaustive way to handle both outcomes.
  ///
  /// Example:
  /// ```dart
  /// myResult.when(
  ///   success: (data) => print('Success: $data'),
  ///   error: (failure) => print('Error: ${failure.message}'),
  /// );
  /// ```
  R when<R>({
    required R Function(T data) success,
    required R Function(ApplicationFailure failure) error,
  }) {
    return switch (this) {
      Success(data: final d) => success(d),
      Error(failure: final f) => error(f),
    };
  }

  /// Executes the given synchronous [operation] and wraps it in a [Result],
  /// catching any [Exception] and converting it to a [ApplicationFailure].
  ///
  /// This is the central point for handling exceptions synchronously and
  /// translating them into a predictable `Error` state.
  static Result<T> guard<T>(T Function() operation) {
    try {
      return Success(operation());
    } on ServerException catch (e) {
      return Error(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on Exception catch (e) {
      // General fallback for any other unhandled exception.
      return Error(UnknownFailure(message: e.toString()));
    }
  }

  /// Executes the given asynchronous [operation] and wraps it in a [Result],
  /// catching any [Exception] and converting it to a [ApplicationFailure].
  ///
  /// This is the central point for handling exceptions asynchronously and
  /// translating them into a predictable `Error` state.
  static Future<Result<T>> guardAsync<T>(Future<T> Function() operation) async {
    try {
      return Success(await operation());
    } on ServerException catch (e) {
      return Error(ServerFailure(message: e.message, statusCode: e.statusCode));
    } on CacheException catch (e) {
      return Error(CacheFailure(message: e.message));
    } on NetworkException catch (e) {
      return Error(NetworkFailure(message: e.message));
    } on Exception catch (e) {
      // General fallback for any other unhandled exception.
      return Error(UnknownFailure(message: e.toString()));
    }
  }
}

/// Represents a successful result with encapsulated [data].
@immutable
final class Success<T> extends Result<T> {
  /// Creates a [Success] instance with the given [data].
  const Success(this.data);
  final T data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success<T> && data == other.data;

  @override
  int get hashCode => data.hashCode;

  @override
  String toString() {
    return 'Success(data: $data)';
  }
}

/// Represents an error result with an encapsulated [failure].
@immutable
final class Error<T> extends Result<T> {
  /// Creates an [Error] instance with the given [failure].
  const Error(this.failure);
  final ApplicationFailure failure;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Error<T> && failure == other.failure;

  @override
  int get hashCode => failure.hashCode;

  @override
  String toString() {
    return 'Error(failure: $failure)';
  }
}
