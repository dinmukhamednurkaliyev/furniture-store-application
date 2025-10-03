import 'dart:async';

import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product.g.dart';

@riverpod
class Product extends _$Product {
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

  void selectCategory(String? category) {
    final currentState = state.asData?.value;
    if (currentState != null) {
      state = AsyncValue.data(
        currentState.copyWith(selectedCategory: category),
      );
    }
  }

  Future<void> toggleFavorite(String productId) async {
    final previousState = state;

    final currentStateValue = state.asData?.value;
    if (currentStateValue == null) return;

    final newProducts = [
      for (final product in currentStateValue.products)
        if (product.id == productId)
          product.copyWith(isFavorite: !product.isFavorite)
        else
          product,
    ];
    state = AsyncValue.data(currentStateValue.copyWith(products: newProducts));

    final toggleFavoriteUsecase = ref.read(toggleFavoriteUsecaseProvider);
    final result = await toggleFavoriteUsecase(productId);

    result.when(
      success: (_) {},
      error: (failure) {
        state = previousState;
      },
    );
  }
}
