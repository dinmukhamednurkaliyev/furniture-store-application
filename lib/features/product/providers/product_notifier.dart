import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/product.dart';

class ProductNotifier extends AsyncNotifier<List<FurnitureEntity>> {
  @override
  Future<List<FurnitureEntity>> build() async {
    final getProducts = ref.read(getProductsUsecaseProvider);
    final result = await getProducts();
    return result.when(
      success: (products) => products,
      error: (failure) => throw Exception(failure.toString()),
    );
  }

  Future<void> toggleFavorite(String productId) async {
    final toggleFavoriteUsecase = ref.read(toggleFavoriteUsecaseProvider);

    final previousState = await future;

    state = AsyncData(
      [
        for (final product in previousState)
          if (product.id == productId)
            product.copyWith(isFavorite: !product.isFavorite)
          else
            product,
      ],
    );

    final result = await toggleFavoriteUsecase(productId);

    result.when(
      success: (_) {},
      error: (failure) {
        state = AsyncData(previousState);
      },
    );
  }
}
