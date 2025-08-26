base class ApplicationException implements Exception {
  ApplicationException({
    this.message = 'An unexpected application error has been occurred',
  });
  final String message;
}

final class ServerException extends ApplicationException {
  ServerException({required super.message, this.statusCode});
  final int? statusCode;
}

final class CacheException extends ApplicationException {
  CacheException({super.message = 'Cache exception occurred'});
}

final class NetworkException extends ApplicationException {
  NetworkException({
    super.message = 'No Internet Connection exception occurred',
  });
}
