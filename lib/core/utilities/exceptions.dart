import 'package:flutter/foundation.dart';

@immutable
base class ApplicationException implements Exception {
  const ApplicationException({
    this.message = 'An unexpected application error has been occurred',
  });
  final String message;
}

@immutable
final class ServerException extends ApplicationException {
  const ServerException({required super.message, this.statusCode});
  final int? statusCode;
}

@immutable
final class CacheException extends ApplicationException {
  const CacheException({super.message = 'Cache exception occurred'});
}

@immutable
final class NetworkException extends ApplicationException {
  const NetworkException({
    super.message = 'No Internet Connection exception occurred',
  });
}
