import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/product.dart';

final getProductsUsecaseProvider = Provider<GetProductsUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsUsecase(repository);
});

final toggleFavoriteUsecaseProvider = Provider<ToggleFavoriteUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ToggleFavoriteUsecase(repository);
});

final getDiscountedPriceUsecaseProvider = Provider<GetDiscountedPriceUsecase>((
  ref,
) {
  final offerRepository = ref.watch(specialOfferRepositoryProvider);
  return GetDiscountedPriceUsecase(offerRepository);
});
