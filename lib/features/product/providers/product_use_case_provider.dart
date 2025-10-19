import 'package:furniture_store_application/features/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_use_case_provider.g.dart';

@riverpod
GetProductsUsecase getProductsUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsUsecase(repository);
}

@riverpod
GetCategoriesUsecase getCategoriesUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetCategoriesUsecase(repository);
}

@riverpod
ToggleFavoriteUsecase toggleFavoriteUsecase(Ref ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ToggleFavoriteUsecase(repository);
}
