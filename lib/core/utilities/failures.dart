import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
sealed class ApplicationFailure with _$ApplicationFailure {
  const factory ApplicationFailure.serverFailure({
    required String message,
    int? statusCode,
  }) = ServerFailure;

  const factory ApplicationFailure.cacheFailure({
    @Default('Cache Failure occurred') String message,
  }) = CacheFailure;

  const factory ApplicationFailure.networkFailure({
    @Default('No internet connection') String message,
  }) = NetworkFailure;

  const factory ApplicationFailure.unknownFailure({
    @Default('An unexpected error occurred.') String message,
  }) = UnknownFailure;
  const ApplicationFailure._();

  @override
  String get message => map(
    serverFailure: (failure) => failure.message,
    cacheFailure: (failure) => failure.message,
    networkFailure: (failure) => failure.message,
    unknownFailure: (failure) => failure.message,
  );
}
