import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'special_offer_use_case_provider.g.dart';

@riverpod
GetOffersByIdsUsecase getOffersByIdsUsecase(Ref ref) {
  final repository = ref.watch(specialOfferRepositoryProvider);
  return GetOffersByIdsUsecase(repository);
}

@riverpod
GetApplicableOffersUsecase getApplicableOffersUsecase(
  Ref ref,
) {
  final repository = ref.watch(specialOfferRepositoryProvider);
  return GetApplicableOffersUsecase(repository);
}

@riverpod
GetBestOfferUsecase getBestOfferUsecase(Ref ref) {
  final getApplicableOffersUsecase = ref.watch(
    getApplicableOffersUsecaseProvider,
  );
  return GetBestOfferUsecase(getApplicableOffersUsecase);
}

@riverpod
GetDiscountedPriceUsecase getDiscountedPriceUsecase(Ref ref) {
  final getBestOfferUsecase = ref.watch(getBestOfferUsecaseProvider);
  return GetDiscountedPriceUsecase(getBestOfferUsecase);
}

@riverpod
GetFeaturedOffersUsecase getFeaturedOffersUsecase(Ref ref) {
  final productRepository = ref.watch(productRepositoryProvider);
  final specialOfferRepository = ref.watch(specialOfferRepositoryProvider);
  return GetFeaturedOffersUsecase(productRepository, specialOfferRepository);
}
