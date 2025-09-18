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

  Future<Result<List<FeaturedOfferDisplayEntity>>> call() async {
    final productResult = await _productRepository.getFeaturedProducts();

    switch (productResult) {
      case Success(data: final products):
        if (products.isEmpty) {
          return const Success<List<FeaturedOfferDisplayEntity>>([]);
        }

        final offerIds = products
            .expand((p) => p.specialOfferIds)
            .toSet()
            .toList();
        if (offerIds.isEmpty) {
          return const Success<List<FeaturedOfferDisplayEntity>>([]);
        }

        final offersResult = await _specialOfferRepository.getOffersByIds(
          offerIds,
        );

        return offersResult.map((offers) {
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
      case Error(failure: final failure):
        return Error(failure);
    }
  }
}
