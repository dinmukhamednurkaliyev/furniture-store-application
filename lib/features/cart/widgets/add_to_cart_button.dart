import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/cart/cart.dart';

class AddToCartButton extends ConsumerWidget {
  const AddToCartButton({
    required this.productId,
    super.key,
  });

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState = ref.watch(cartProvider);
    final isAddingToCart = cartState.addingIds.contains(productId);
    final isInCart = cartState.itemIds.contains(productId);

    final icon = isInCart
        ? Icons.check
        : isAddingToCart
        ? null
        : Icons.shopping_cart;

    final color = isInCart || isAddingToCart
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
          onTap: isAddingToCart || isInCart
              ? null
              : () => ref.read(cartProvider.notifier).addToCart(productId),
          borderRadius: context.radiusValues.circularSmall,
          child: Center(
            child: isAddingToCart
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
