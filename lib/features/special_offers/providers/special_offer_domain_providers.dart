import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

final getOffersByIdsUsecaseProvider = Provider<GetOffersByIdsUsecase>((ref) {
  final repository = ref.watch(specialOfferRepositoryProvider);
  return GetOffersByIdsUsecase(repository);
});

final getApplicableOffersUsecaseProvider = Provider<GetApplicableOffersUsecase>(
  (ref) {
    final repository = ref.watch(specialOfferRepositoryProvider);
    return GetApplicableOffersUsecase(repository);
  },
);

final getBestOfferUsecaseProvider = Provider<GetBestOfferUsecase>((ref) {
  final getApplicableOffersUsecase = ref.watch(
    getApplicableOffersUsecaseProvider,
  );
  return GetBestOfferUsecase(getApplicableOffersUsecase);
});

final getDiscountedPriceUsecaseProvider = Provider<GetDiscountedPriceUsecase>((
  ref,
) {
  final getBestOfferUsecase = ref.watch(getBestOfferUsecaseProvider);
  return GetDiscountedPriceUsecase(getBestOfferUsecase);
});

final getFeaturedOffersUsecaseProvider = Provider<GetFeaturedOffersUsecase>((
  ref,
) {
  final productRepository = ref.watch(productRepositoryProvider);
  final specialOfferRepository = ref.watch(specialOfferRepositoryProvider);
  return GetFeaturedOffersUsecase(productRepository, specialOfferRepository);
});
