import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/core/core.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success<T>;
  const factory Result.error(ApplicationFailure failure) = Error<T>;

  const Result._();

  static Result<T> guard<T>(T Function() operation) {
    try {
      return Result.success(operation());
    } on ApplicationException catch (e) {
      return e.when(
        serverException: (message, statusCode) => Result.error(
          ApplicationFailure.serverFailure(
            message: message,
            statusCode: statusCode,
          ),
        ),
        cacheException: (message) =>
            Result.error(ApplicationFailure.cacheFailure(message: message)),
        networkException: (message) => Result.error(
          ApplicationFailure.networkFailure(message: message),
        ),
      );
    } on Exception catch (e) {
      return Result.error(
        ApplicationFailure.unknownFailure(message: e.toString()),
      );
    }
  }

  static Future<Result<T>> guardAsync<T>(Future<T> Function() operation) async {
    try {
      return Result.success(await operation());
    } on ApplicationException catch (e) {
      return e.when(
        serverException: (message, statusCode) => Result.error(
          ApplicationFailure.serverFailure(
            message: message,
            statusCode: statusCode,
          ),
        ),
        cacheException: (message) =>
            Result.error(ApplicationFailure.cacheFailure(message: message)),
        networkException: (message) => Result.error(
          ApplicationFailure.networkFailure(message: message),
        ),
      );
    } on Exception catch (e) {
      return Result.error(
        ApplicationFailure.unknownFailure(message: e.toString()),
      );
    }
  }
}
