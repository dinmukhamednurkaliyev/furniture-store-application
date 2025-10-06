import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';

class FeaturedItemsWidget extends StatelessWidget {
  const FeaturedItemsWidget({
    required this.featuredProducts,
    super.key,
  });

  final List<FurnitureEntity> featuredProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: context.spacingValues.medium,
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
                'Featured Items',
                style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: context.primaryColor,
                  textStyle: context.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                child: const Text('View all'),
              ),
            ],
          ),
        ),
        if (featuredProducts.isEmpty)
          const SizedBox(
            height: 100,
            child: Center(child: Text('No featured items available.')),
          )
        else
          SizedBox(
            height: 280,
            child: ListView.separated(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingValues.large,
              ),
              scrollDirection: Axis.horizontal,
              itemCount: featuredProducts.length,
              itemBuilder: (context, index) {
                final item = featuredProducts[index];
                return _ProductCard(product: item);
              },

              separatorBuilder: (context, index) =>
                  SizedBox(width: context.paddingValues.medium),
            ),
          ),
      ],
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final FurnitureEntity product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,

      child: Card.filled(
        color: context.colorScheme.surface,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Padding(
                padding: context.paddingValues.allSmall,

                child: Image.asset(
                  product.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: context.paddingValues.allMedium,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: context.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  context.spacingValues.verticalSmall,
                  Text(
                    '\$${product.price.toStringAsFixed(0)}',
                    style: context.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: context.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
