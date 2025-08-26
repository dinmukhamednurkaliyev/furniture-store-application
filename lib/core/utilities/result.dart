import 'package:furniture_store_application/core/core.dart';

sealed class Result<T> {}

final class Success<T> extends Result<T> {
  Success(this.data);
  final T data;
}

final class Error<T> extends Result<T> {
  Error(this.failure);
  final Failure failure;
}
