import 'dart:math';

import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/entities/furniture_entity.dart';
import 'package:furniture_store_application/features/product/repositories/mock_special_offer_repository.dart';

class GetDiscountedPriceUsecase {
  const GetDiscountedPriceUsecase(this._offerRepository);
  final ISpecialOfferRepository _offerRepository;

  Future<Result<double>> call({required FurnitureEntity furniture}) async {
    if (!furniture.hasSpecialOffer) {
      return Success(furniture.price);
    }

    final offersResult = await _offerRepository.getOffersByIds(
      furniture.specialOfferIds,
    );

    return offersResult.map((offers) {
      if (offers.isEmpty) {
        return furniture.price;
      }
      // Find the best discount
      final bestDiscount = offers.map((o) => o.discountPercentage).reduce(max);

      final discountedPrice =
          furniture.price - (furniture.price * (bestDiscount / 100));
      return discountedPrice;
    });
  }
}