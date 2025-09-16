import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/product.dart';

class ProductNotifier extends AsyncNotifier<ProductState> {
  @override
  Future<ProductState> build() async {
    final getProducts = ref.read(getProductsUsecaseProvider);
    final getCategories = ref.read(getCategoriesUsecaseProvider);

    final productsResult = await getProducts();
    final categoriesResult = await getCategories();

    final products = productsResult.when(
      success: (data) => data,
      error: (failure) => throw Exception(failure.toString()),
    );
    final categories = categoriesResult.when(
      success: (data) => data,
      error: (failure) => throw Exception(failure.toString()),
    );

    return ProductState(
      products: products,
      categories: categories,
    );
  }

  Future<void> selectCategory(String? category) async {
    final currentState = state.valueOrNull;
    if (currentState != null) {
      state = AsyncValue.data(
        currentState.copyWith(selectedCategory: category),
      );
    }
  }

  Future<void> toggleFavorite(String productId) async {
    final toggleFavoriteUsecase = ref.read(toggleFavoriteUsecaseProvider);

    final previousState = state;
    final currentStateValue = state.valueOrNull;
    if (currentStateValue == null) return;

    final newProducts = [
      for (final product in currentStateValue.products)
        if (product.id == productId)
          product.copyWith(isFavorite: !product.isFavorite)
        else
          product,
    ];
    state = AsyncValue.data(currentStateValue.copyWith(products: newProducts));

    final result = await toggleFavoriteUsecase(productId);

    result.when(
      success: (_) {},
      error: (failure) {
        state = previousState;
      },
    );
  }
}
