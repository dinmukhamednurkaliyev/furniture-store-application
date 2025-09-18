import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/entities/special_offer_entity.dart';

@immutable
class FeaturedOfferDisplayEntity {
  const FeaturedOfferDisplayEntity({required this.offer, required this.product});
  final SpecialOfferEntity offer;
  final FurnitureEntity product;
}
