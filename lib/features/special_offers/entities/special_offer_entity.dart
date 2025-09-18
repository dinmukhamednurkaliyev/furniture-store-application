import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/features/product/product.dart';

@immutable
class SpecialOfferEntity {
  const SpecialOfferEntity({
    required this.name,
    required this.id,
    required this.discountPercentage,
    required this.description,
    required this.startDate,
    required this.endDate,
    this.applicableCategories,
    this.applicableProductId,
    this.minimumPurchaseAmount,
    this.isActive = true,
  });

  final String id;
  final String name;
  final String description;
  final double discountPercentage;
  final DateTime startDate;
  final DateTime endDate;
  final List<String>? applicableCategories;
  final List<String>? applicableProductId;
  final double? minimumPurchaseAmount;
  final bool isActive;

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

  SpecialOfferEntity copyWith({
    String? id,
    String? title,
    String? description,
    double? discountPercentage,
    DateTime? startDate,
    DateTime? endDate,
    List<String>? applicableCategories,
    List<String>? applicableProductId,
    double? minimumPurchaseAmount,
    bool? isActive,
  }) {
    return SpecialOfferEntity(
      id: id ?? this.id,
      name: title ?? name,
      description: description ?? this.description,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      applicableCategories: applicableCategories ?? this.applicableCategories,
      applicableProductId: applicableProductId ?? this.applicableProductId,
      minimumPurchaseAmount:
          minimumPurchaseAmount ?? this.minimumPurchaseAmount,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SpecialOfferEntity &&
        other.id == id &&
        other.discountPercentage == discountPercentage;
  }

  @override
  int get hashCode => id.hashCode ^ discountPercentage.hashCode;
}
