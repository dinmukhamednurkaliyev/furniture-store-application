import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

part 'special_offer_data_providers.g.dart';

@riverpod
SpecialOfferLocalDataSource specialOfferLocalDataSource(
    Ref ref) {
  return SpecialOfferLocalDataSourceImplementation();
}

@riverpod
SpecialOfferRepository specialOfferRepository(Ref ref) {
  final localDataSource = ref.watch(specialOfferLocalDataSourceProvider);
  return SpecialOfferRepositoryImplementation(localDataSource);
}