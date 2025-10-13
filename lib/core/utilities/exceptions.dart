import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
sealed class ApplicationException with _$ApplicationException implements Exception {
  const factory ApplicationException.serverException({
    required String message,
    int? statusCode,
  }) = ServerException;

  const factory ApplicationException.cacheException({
    @Default('Cache exception occurred') String message,
  }) = CacheException;

  const factory ApplicationException.networkException({
    @Default('No Internet Connection exception occurred') String message,
  }) = NetworkException;
}