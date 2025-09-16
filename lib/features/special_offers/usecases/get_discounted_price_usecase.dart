import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class GetDiscountedPriceUsecase {
  const GetDiscountedPriceUsecase(this._getBestOfferUsecase);

  final GetBestOfferUsecase _getBestOfferUsecase;

  Future<Result<double>> call({
    required FurnitureEntity product,
  }) async {
    final bestOfferResult = await _getBestOfferUsecase(product: product);

    return bestOfferResult.map((bestOffer) {
      if (bestOffer == null) {
        return product.price;
      }
      final discount = product.price * bestOffer.discountPercentage / 100;
      return product.price - discount;
    });
  }
}
