import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/product/product.dart';

class ProductsWidget extends ConsumerWidget {
  const ProductsWidget({
    required this.products,
    required this.onFavoriteToggle,
    super.key,
  });

  final List<FurnitureEntity> products;
  final ValueChanged<String> onFavoriteToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.paddingValues.large,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Products',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {
                  // TODO: Navigate to a "View all products" page
                },
                child: const Text('View all'),
              ),
            ],
          ),
        ),
        SizedBox(height: context.spacingValues.medium),
        if (products.isEmpty)
          const SizedBox(
            height: 100,
            child: Center(child: Text('No products available.')),
          )
        else
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(
              horizontal: context.paddingValues.large,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobileScreen
                  ? 2
                  : (context.isTabletScreen ? 3 : 4),
              crossAxisSpacing: context.spacingValues.medium,
              mainAxisSpacing: context.spacingValues.medium,
              childAspectRatio: 0.7,
            ),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return AnimatedListItemWidget(
                index: index,
                child: Hero(
                  tag: 'product_${product.id}',
                  child: ProductCard(
                    product: product,
                    onTap: () {
                      // TODO: Navigate to product detail page
                    },
                    onFavoritePressed: () => onFavoriteToggle(product.id),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
