import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class GetApplicableOffersUsecase {
  const GetApplicableOffersUsecase(this._repository);
  final SpecialOfferRepository _repository;

  Future<Result<List<SpecialOfferEntity>>> call({
    required FurnitureEntity product,
  }) async {
    if (product.specialOfferIds.isEmpty) {
      return const Success([]);
    }

    final offersResult = await _repository.getOffersByIds(
      product.specialOfferIds,
    );

    return offersResult.map((offers) {
      final applicableOffers = offers.where((offer) {
        return offer.isApplicableToProduct(product);
      }).toList();

      return applicableOffers;
    });
  }
}
