import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/product.dart';

final getProductsUsecaseProvider = Provider<GetProductsUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsUsecase(repository);
});

final getCategoriesUsecaseProvider = Provider<GetCategoriesUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetCategoriesUsecase(repository);
});

final toggleFavoriteUsecaseProvider = Provider<ToggleFavoriteUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ToggleFavoriteUsecase(repository);
});
