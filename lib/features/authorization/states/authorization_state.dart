import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

@immutable
sealed class AuthorizationState {
  const AuthorizationState();
}

final class AuthorizationInitial extends AuthorizationState {}

final class AuthorizationLoading extends AuthorizationState {}

final class Authenticated extends AuthorizationState {
  const Authenticated(this.user);
  final UserModel user;
}

final class Unauthenticated extends AuthorizationState {}

final class AuthorizationError extends AuthorizationState {
  const AuthorizationError(this.message);
  final String message;
}
