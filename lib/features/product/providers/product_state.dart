import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/features/product/product.dart';

part 'product_state.freezed.dart';
part 'product_state.g.dart';

@freezed
abstract class ProductState with _$ProductState {
  const factory ProductState({
    @Default([]) List<FurnitureEntity> products,
    @Default([]) List<String> categories,
    @Default('All') String? selectedCategory,
  }) = _ProductState;

  factory ProductState.fromJson(Map<String, dynamic> json) =>
      _$ProductStateFromJson(json);

  const ProductState._();

  List<FurnitureEntity> get filteredProducts {
    if (selectedCategory == null || selectedCategory == 'All') {
      return products;
    }
    return products
        .where((product) => product.category == selectedCategory)
        .toList();
  }
}
