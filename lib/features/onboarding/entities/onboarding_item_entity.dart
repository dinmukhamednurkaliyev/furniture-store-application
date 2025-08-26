import 'package:flutter/foundation.dart';

@immutable
class OnboardingItemEntity {
  const OnboardingItemEntity({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  final String title;
  final String description;
  final String imagePath;
}
