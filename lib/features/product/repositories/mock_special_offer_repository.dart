import 'package:furniture_store_application/core/core.dart';

class SpecialOffer {
  const SpecialOffer({required this.id, required this.discountPercentage});
  final String id;
  final double discountPercentage;
}

const _offers = [
  SpecialOffer(id: 'summer_sale', discountPercentage: 15),
  SpecialOffer(id: 'storage_special', discountPercentage: 20),
  SpecialOffer(id: 'premium_offer', discountPercentage: 10),
];

abstract interface class ISpecialOfferRepository {
  Future<Result<List<SpecialOffer>>> getOffersByIds(List<String> ids);
}

class MockSpecialOfferRepository implements ISpecialOfferRepository {
  @override
  Future<Result<List<SpecialOffer>>> getOffersByIds(List<String> ids) async {
    await Future.delayed(const Duration(milliseconds: 80)); // Simulate delay
    final foundOffers = _offers
        .where((offer) => ids.contains(offer.id))
        .toList();
    return Success(foundOffers);
  }
}
