import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class GetFeaturedOffersUsecase {
  const GetFeaturedOffersUsecase(
    this._productRepository,
    this._specialOfferRepository,
  );

  final ProductRepository _productRepository;
  final SpecialOfferRepository _specialOfferRepository;

  Future<Result<List<FeaturedOfferDisplayEntity>>> call() {
    return Result.guardAsync(() async {
      final products = await _productRepository.getFeaturedProducts().then(
        (result) => result.when(
          success: (data) => data,
          error: (failure) =>
              throw ApplicationException(message: failure.message),
        ),
      );

      if (products.isEmpty) {
        return <FeaturedOfferDisplayEntity>[];
      }

      final offerIds = products
          .expand((product) => product.specialOfferIds)
          .toSet()
          .toList();
      if (offerIds.isEmpty) {
        return <FeaturedOfferDisplayEntity>[];
      }

      final offers = await _specialOfferRepository
          .getOffersByIds(offerIds)
          .then(
            (result) => result.when(
              success: (data) => data,
              error: (failure) =>
                  throw ApplicationException(message: failure.message),
            ),
          );

      final productByOfferId = <String, FurnitureEntity>{};
      for (final product in products) {
        for (final offerId in product.specialOfferIds) {
          if (!productByOfferId.containsKey(offerId)) {
            productByOfferId[offerId] = product;
          }
        }
      }

      final displayOffers = offers
          .map((offer) {
            final product = productByOfferId[offer.id];
            return product != null
                ? FeaturedOfferDisplayEntity(offer: offer, product: product)
                : null;
          })
          .whereType<FeaturedOfferDisplayEntity>()
          .toList();

      return displayOffers;
    });
  }
}
