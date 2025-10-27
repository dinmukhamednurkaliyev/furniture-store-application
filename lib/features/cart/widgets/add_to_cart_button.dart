import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/cart/cart.dart';
import 'package:furniture_store_application/features/product/product.dart';

class AddToCartButton extends ConsumerWidget {
  const AddToCartButton({
    required this.product,
    super.key,
  });

  final FurnitureEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final isAdding = cartState.addingIds.contains(product.id);
    final isRemoving = cartState.removingIds.contains(product.id);
    final isLoading = isAdding || isRemoving;

    final isInCart = cartState.items.any(
      (item) => item.furniture.id == product.id,
    );

    final icon = isLoading
        ? null
        : isInCart
        ? Icons.check
        : Icons.shopping_cart;

    final color = (isInCart && !isRemoving) || isAdding
        ? Colors.green
        : context.primaryColor;

    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: color,
        borderRadius: context.radiusValues.circularSmall,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: isLoading
              ? null
              : () => ref.read(cartProvider.notifier).toggleCartItem(product),
          borderRadius: context.radiusValues.circularSmall,
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Icon(
                    icon,
                    color: Colors.white,
                    size: 20,
                  ),
          ),
        ),
      ),
    );
  }
}
