import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/core/core.dart';

part 'onboarding_item_entity.freezed.dart';

@freezed
abstract class OnboardingItemEntity with _$OnboardingItemEntity {
  const factory OnboardingItemEntity({
    required String title,
    required String description,
    required ImageEntity image,
  }) = _OnboardingItemEntity;
}
