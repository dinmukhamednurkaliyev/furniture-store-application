import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/home/home.dart';
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
                child: const Text('View all'),
              ),
            ],
          ),
        ),
        SizedBox(height: context.spacingValues.medium),
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
                final product = featuredProducts[index];
                return SizedBox(
                  width: 180,
                  child: AnimatedListItemWidget(
                    index: index,
                    child: Hero(
                      tag: 'featured_${product.id}',
                      child: ProductCard(
                        product: product,
                        onTap: () {},
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: context.paddingValues.medium),
            ),
          ),
      ],
    );
  }
}
