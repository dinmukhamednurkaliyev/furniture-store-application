import 'package:furniture_store_application/features/special_offers/special_offers.dart';

abstract interface class SpecialOfferLocalDataSource {
  Future<List<SpecialOfferEntity>> getOffersByIds(List<String> ids);
}

class SpecialOfferLocalDataSourceImplementation
    implements SpecialOfferLocalDataSource {
  @override
  Future<List<SpecialOfferEntity>> getOffersByIds(List<String> ids) async {
    await Future.delayed(const Duration(milliseconds: 80));
    final foundOffers = offers
        .where((offer) => ids.contains(offer.id))
        .toList();
    return foundOffers;
  }
}
