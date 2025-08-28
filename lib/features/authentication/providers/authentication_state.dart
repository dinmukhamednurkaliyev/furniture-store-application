import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';

@immutable
class AuthenticationState {
  const AuthenticationState({
    this.isSignIn,
    this.isLoading,
    this.errorMessage,
    this.user,
  });

  final bool? isSignIn;
  final bool? isLoading;
  final UserEntity? user;
  final String? errorMessage;

  AuthenticationState copyWith({
    bool? isSignIn,
    bool? isLoading,
    UserEntity? user,
    String? errorMessage,
  }) {
    return AuthenticationState(
      isSignIn: isSignIn ?? this.isSignIn,
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
