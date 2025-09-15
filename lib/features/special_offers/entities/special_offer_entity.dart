import 'package:flutter/foundation.dart';

@immutable
class SpecialOfferEntity {
  const SpecialOfferEntity({
    required this.id,
    required this.discountPercentage,
  });

  final String id;

  final double discountPercentage;

  SpecialOfferEntity copyWith({
    String? id,
    double? discountPercentage,
  }) {
    return SpecialOfferEntity(
      id: id ?? this.id,
      discountPercentage: discountPercentage ?? this.discountPercentage,
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
