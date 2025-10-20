import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/core/core.dart';

part 'furniture_entity.freezed.dart';
part 'furniture_entity.g.dart';

@freezed
abstract class FurnitureEntity with _$FurnitureEntity {
  const factory FurnitureEntity({
    required String id,
    required String name,
    required String category,
    required String description,
    required double price,
    required ImageEntity imageUrl,
    required List<ImageEntity> images,
    required List<String> colors,
    @Default([]) List<String> specialOfferIds,
    @Default(false) bool isFavorite,
    double? discountedPrice,
  }) = _FurnitureEntity;

  factory FurnitureEntity.fromJson(Map<String, dynamic> json) =>
      _$FurnitureEntityFromJson(json);
  const FurnitureEntity._();

  bool get hasSpecialOffer => specialOfferIds.isNotEmpty;
}
