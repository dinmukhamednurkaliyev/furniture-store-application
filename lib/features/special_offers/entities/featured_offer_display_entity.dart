import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/entities/special_offer_entity.dart';

part 'featured_offer_display_entity.freezed.dart';

@freezed
abstract class FeaturedOfferDisplayEntity with _$FeaturedOfferDisplayEntity {
  const factory FeaturedOfferDisplayEntity({
    required SpecialOfferEntity offer,
    required FurnitureEntity product,
  }) = _FeaturedOfferDisplayEntity;
}
