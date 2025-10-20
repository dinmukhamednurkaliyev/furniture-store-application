import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_notifier.freezed.dart';
part 'cart_notifier.g.dart';

@freezed
abstract class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<String> itemIds,
    @Default({}) Set<String> addingIds,
  }) = _CartState;
}

@riverpod
class CartNotifier extends _$CartNotifier {
  @override
  CartState build() {
    return const CartState();
  }

  Future<void> addToCart(String productId) async {
    if (state.itemIds.contains(productId) ||
        state.addingIds.contains(productId)) {
      return;
    }

    state = state.copyWith(addingIds: {...state.addingIds, productId});

    await Future.delayed(const Duration(seconds: 1));

    final newAddingIds = Set<String>.from(state.addingIds)..remove(productId);

    state = state.copyWith(
      itemIds: [...state.itemIds, productId],
      addingIds: newAddingIds,
    );
  }

  void removeFromCart(String productId) {
    state = state.copyWith(
      itemIds: state.itemIds.where((id) => id != productId).toList(),
    );
  }
}
