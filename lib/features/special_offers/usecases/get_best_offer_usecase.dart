import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class GetBestOfferUsecase {
  const GetBestOfferUsecase(this._getApplicableOffersUsecase);
  final GetApplicableOffersUsecase _getApplicableOffersUsecase;
  Future<Result<SpecialOfferEntity?>> call({
    required FurnitureEntity product,
  }) async {
    final applicableOfferResult = await _getApplicableOffersUsecase(
      product: product,
    );

    return applicableOfferResult.map((offers) {
      if (offers.isEmpty) {
        return null;
      }

      return offers.reduce((current, next) {
        return current.discountPercentage > next.discountPercentage
            ? current
            : next;
      });
    });
  }
}
