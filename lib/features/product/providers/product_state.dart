import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:furniture_store_application/features/product/product.dart';

@immutable
class ProductState {
  const ProductState({
    this.products = const [],
    this.categories = const [],
    this.selectedCategory = 'All',
  });
  final List<FurnitureEntity> products;
  final List<String> categories;
  final String? selectedCategory;

  List<FurnitureEntity> get filteredProducts {
    if (selectedCategory == null || selectedCategory == 'All') {
      return products;
    }
    return products
        .where((product) => product.category == selectedCategory)
        .toList();
  }

  ProductState copyWith({
    List<FurnitureEntity>? products,
    List<String>? categories,
    String? selectedCategory,
  }) {
    return ProductState(
      products: products ?? this.products,
      categories: categories ?? this.categories,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is ProductState &&
        listEquals(other.products, products) &&
        listEquals(other.categories, categories) &&
        other.selectedCategory == selectedCategory;
  }

  @override
  int get hashCode =>
      products.hashCode ^ categories.hashCode ^ selectedCategory.hashCode;
}
