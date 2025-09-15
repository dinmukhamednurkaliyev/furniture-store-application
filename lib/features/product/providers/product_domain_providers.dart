import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/providers/product_data_providers.dart';
import 'package:furniture_store_application/features/product/usecases/usecases.dart';

final getProductsUsecaseProvider = Provider<GetProductsUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return GetProductsUsecase(repository);
});

final toggleFavoriteUsecaseProvider = Provider<ToggleFavoriteUsecase>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ToggleFavoriteUsecase(repository);
});
