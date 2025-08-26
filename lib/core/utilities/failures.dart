import 'package:flutter/foundation.dart';

@immutable
sealed class Failure {
  const Failure({required this.message});
  final String message;
}

final class ServerFailure extends Failure {
  const ServerFailure({required super.message});
}

final class CacheFailure extends Failure {
  const CacheFailure({super.message = 'Cache Failure occurred'});
}

final class NetworkFailure extends Failure {
  const NetworkFailure({super.message = 'No internet connection'});
}
