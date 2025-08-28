import 'package:flutter/widgets.dart';
import 'package:furniture_store_application/core/core.dart';

@immutable
sealed class Result<T> {}

@immutable
final class Success<T> extends Result<T> {
  Success(this.data);
  final T data;
}

@immutable
final class Error<T> extends Result<T> {
  Error(this.failure);
  final Failure failure;
}
