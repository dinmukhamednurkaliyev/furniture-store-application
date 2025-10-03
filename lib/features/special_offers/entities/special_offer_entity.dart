import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/features/product/product.dart';

part 'special_offer_entity.freezed.dart';
part 'special_offer_entity.g.dart';

@freezed
abstract class SpecialOfferEntity with _$SpecialOfferEntity {
  const factory SpecialOfferEntity({
    required String id,
    required String name,
    required String description,
    required double discountPercentage,
    required DateTime startDate,
    required DateTime endDate,
    List<String>? applicableCategories,
    List<String>? applicableProductId,
    double? minimumPurchaseAmount,
    @Default(true) bool isActive,
  }) = _SpecialOfferEntity;

  factory SpecialOfferEntity.fromJson(Map<String, dynamic> json) =>
      _$SpecialOfferEntityFromJson(json);
  const SpecialOfferEntity._();

  bool isApplicableToProduct(FurnitureEntity product) {
    if (!isActive) {
      return false;
    }

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final start = DateTime(startDate.year, startDate.month, startDate.day);
    final end = DateTime(endDate.year, endDate.month, endDate.day);

    if (today.isBefore(start) || today.isAfter(end)) {
      return false;
    }

    if (minimumPurchaseAmount != null &&
        product.price < minimumPurchaseAmount!) {
      return false;
    }

    final isGenerallyApplicable =
        (applicableProductId == null || applicableProductId!.isEmpty) &&
        (applicableCategories == null || applicableCategories!.isEmpty);

    final appliesToProduct = applicableProductId?.contains(product.id) ?? false;
    final appliesToCategory =
        applicableCategories?.contains(product.category) ?? false;

    return isGenerallyApplicable || appliesToProduct || appliesToCategory;
  }
}
