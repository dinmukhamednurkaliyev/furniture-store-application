import 'package:furniture_store_application/features/special_offers/special_offers.dart';

const _offers = [
  SpecialOfferEntity(id: 'summer_sale', discountPercentage: 15),
  SpecialOfferEntity(id: 'storage_special', discountPercentage: 20),
  SpecialOfferEntity(id: 'premium_offer', discountPercentage: 10),
];

class SpecialOfferLocalDataSource {
  Future<List<SpecialOfferEntity>> getOffersByIds(List<String> ids) async {
    await Future.delayed(const Duration(milliseconds: 80));
    final foundOffers = _offers
        .where((offer) => ids.contains(offer.id))
        .toList();
    return foundOffers;
  }
}
