import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

final getOffersByIdsUsecaseProvider = Provider<GetOffersByIdsUsecase>((ref) {
  final repository = ref.watch(specialOfferRepositoryProvider);
  return GetOffersByIdsUsecase(repository);
});
