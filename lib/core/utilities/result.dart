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
    } on ServerException catch (e) {
      return Result.error(
        ApplicationFailure.serverFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on CacheException catch (e) {
      return Result.error(ApplicationFailure.cacheFailure(message: e.message));
    } on NetworkException catch (e) {
      return Result.error(
        ApplicationFailure.networkFailure(message: e.message),
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
    } on ServerException catch (e) {
      return Result.error(
        ApplicationFailure.serverFailure(
          message: e.message,
          statusCode: e.statusCode,
        ),
      );
    } on CacheException catch (e) {
      return Result.error(ApplicationFailure.cacheFailure(message: e.message));
    } on NetworkException catch (e) {
      return Result.error(
        ApplicationFailure.networkFailure(message: e.message),
      );
    } on Exception catch (e) {
      return Result.error(
        ApplicationFailure.unknownFailure(message: e.toString()),
      );
    }
  }
}
