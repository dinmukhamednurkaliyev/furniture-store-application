import 'package:flutter/foundation.dart';

@immutable
sealed class ApplicationState {
  const ApplicationState();
}

final class ApplicationInitial extends ApplicationState {}

final class ApplicationLoading extends ApplicationState {}

final class ApplicationReady extends ApplicationState {
  const ApplicationReady({
    required this.hasSeenOnboarding,
  });
  final bool hasSeenOnboarding;
}
