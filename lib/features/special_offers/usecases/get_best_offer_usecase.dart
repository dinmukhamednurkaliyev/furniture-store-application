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

    return applicableOfferResult.when(
      success: (offers) {
        if (offers.isEmpty) {
          return const Result.success(null);
        }

        final bestOffer = offers.reduce((current, next) {
          return current.discountPercentage > next.discountPercentage
              ? current
              : next;
        });
        return Result.success(bestOffer);
      },
      error: (failure) => Result.error(failure),
    );
  }
}
