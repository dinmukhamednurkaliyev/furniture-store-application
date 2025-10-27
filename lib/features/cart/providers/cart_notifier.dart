import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/features/cart/entities/cart_item_entity.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier.freezed.dart';
part 'cart_notifier.g.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItemEntity> items,
    @Default({}) Set<String> addingIds,
    @Default({}) Set<String> removingIds,
  }) = _CartState;
}

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() {
    return const CartState();
  }

  Future<void> toggleCartItem(FurnitureEntity furniture) async {
    final productId = furniture.id;
    final existingItemIndex =
        state.items.indexWhere((item) => item.furniture.id == productId);

    if (state.addingIds.contains(productId) ||
        state.removingIds.contains(productId)) {
      return;
    }

    if (existingItemIndex != -1) {
      // Item exists, so remove it with a delay.
      state = state.copyWith(removingIds: {...state.removingIds, productId});
      await Future.delayed(const Duration(seconds: 1));

      // After delay, filter the list to be safe from state changes during the await.
      final updatedItems =
          state.items.where((item) => item.furniture.id != productId).toList();

      final newRemovingIds =
          Set<String>.from(state.removingIds)..remove(productId);

      state = state.copyWith(items: updatedItems, removingIds: newRemovingIds);
    } else {
      // Item does not exist, so add it.
      state = state.copyWith(addingIds: {...state.addingIds, productId});

      await Future.delayed(const Duration(seconds: 1));

      final newItem = CartItemEntity(
        furniture: furniture,
        quantity: 1,
        // Defensively check if the colors list is not empty.
        selectedColor: furniture.colors.isNotEmpty ? furniture.colors.first : '',
      );

      final newAddingIds = Set<String>.from(state.addingIds)..remove(productId);

      state = state.copyWith(
        items: [...state.items, newItem],
        addingIds: newAddingIds,
      );
    }
  }
}
