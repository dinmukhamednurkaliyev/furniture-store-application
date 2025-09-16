import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

final specialOfferLocalDataSourceProvider =
    Provider<SpecialOfferLocalDataSource>((ref) {
      return SpecialOfferLocalDataSourceImplementation();
    });

final specialOfferRepositoryProvider = Provider<SpecialOfferRepository>((ref) {
  final localDataSource = ref.watch(specialOfferLocalDataSourceProvider);
  return SpecialOfferRepositoryImplementation(localDataSource);
});
