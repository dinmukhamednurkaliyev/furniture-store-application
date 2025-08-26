import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/features/authorization/authorization.dart';

@immutable
sealed class ApplicationState {
  const ApplicationState();
}

final class ApplicationInitial extends ApplicationState {}

final class ApplicationLoading extends ApplicationState {}

final class ApplicationReady extends ApplicationState {
  const ApplicationReady({
    required this.hasSeenOnboarding,
    this.currentUser,
  });
  final bool hasSeenOnboarding;
  final UserEntity? currentUser;

  bool get isAuthenticated => currentUser != null;

  ApplicationReady copyWith({
    bool? hasSeenOnboarding,
    UserEntity? currentUser,
    bool clearCurrentUser = false,
  }) {
    return ApplicationReady(
      hasSeenOnboarding: hasSeenOnboarding ?? this.hasSeenOnboarding,
      currentUser: clearCurrentUser ? null : currentUser ?? this.currentUser,
    );
  }
}

final class ApplicationError extends ApplicationState {
  const ApplicationError(this.message);
  final String message;
}
