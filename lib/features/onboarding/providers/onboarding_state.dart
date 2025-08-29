import 'package:flutter/cupertino.dart';
import 'package:furniture_store_application/features/onboarding/onboarding.dart';

@immutable
class OnboardingState {
  const OnboardingState({
    this.isDataLoading = true,
    this.isActionLoading = false,
    this.items = const [],
    this.errorMessage,
  });

  final bool isDataLoading;
  final bool isActionLoading;
  final List<OnboardingItemEntity> items;
  final String? errorMessage;

  OnboardingState copyWith({
    bool? isDataLoading,
    bool? isActionLoading,
    List<OnboardingItemEntity>? items,
    String? errorMessage,
  }) {
    return OnboardingState(
      isDataLoading: isDataLoading ?? this.isDataLoading,
      isActionLoading: isActionLoading ?? this.isActionLoading,
      items: items ?? this.items,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
