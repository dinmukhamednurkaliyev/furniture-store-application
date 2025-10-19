import 'package:furniture_store_application/features/special_offers/special_offers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'special_offer_repository_provider.g.dart';

@riverpod
SpecialOfferLocalDataSource specialOfferLocalDataSource(Ref ref) {
  return SpecialOfferLocalDataSourceImplementation();
}

@riverpod
SpecialOfferRepository specialOfferRepository(Ref ref) {
  final localDataSource = ref.watch(specialOfferLocalDataSourceProvider);
  return SpecialOfferRepositoryImplementation(localDataSource);
}
