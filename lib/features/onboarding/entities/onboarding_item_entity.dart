import 'package:freezed_annotation/freezed_annotation.dart';

part 'onboarding_item_entity.freezed.dart';

@freezed
abstract class OnboardingItemEntity with _$OnboardingItemEntity {
  const factory OnboardingItemEntity({
    required String title,
    required String description,
    required String imagePath,
  }) = _OnboardingItemEntity;
}
