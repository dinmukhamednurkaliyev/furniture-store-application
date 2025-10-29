import 'package:application_core/application_core.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({
    required this.categories,
    required this.onCategorySelected,
    required this.featuredOffers,
    required this.featuredProducts,
    required this.onFavoriteToggle,
    required this.allProducts,
    this.selectedCategory,
    super.key,
  });

  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String> onCategorySelected;
  final List<FeaturedOfferDisplayEntity> featuredOffers;
  final List<FurnitureEntity> featuredProducts;
  final ValueChanged<String> onFavoriteToggle;
  final List<FurnitureEntity> allProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.paddingValues.large,
      children: [
        _CategoryFilter(
          categories: categories,
          selectedCategory: selectedCategory,
          onCategorySelected: onCategorySelected,
        ),
        SpecialOffersWidget(offers: featuredOffers),
        FeaturedItemsWidget(
          featuredProducts: featuredProducts,
          onFavoriteToggle: onFavoriteToggle,
        ),
        ProductsWidget(
          products: allProducts,
          onFavoriteToggle: onFavoriteToggle,
        ),
      ],
    );
  }
}

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({
    required this.categories,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> categories;
  final String? selectedCategory;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: context.paddingValues.large),
          child: Text(
            'Categories',
            style: context.text.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: categories.map((category) {
              final isSelected = selectedCategory == category;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: ChoiceChip(
                  shape: const StadiumBorder(),
                  label: Text(category),
                  selected: isSelected,
                  onSelected: (wasSelected) {
                    if (wasSelected) {
                      onCategorySelected(category);
                    }
                  },
                  selectedColor: context.color.primary,
                  labelStyle: TextStyle(
                    color: isSelected
                        ? context.color.onPrimary
                        : context.color.onSurface,
                  ),
                  showCheckmark: false,
                  avatar: isSelected
                      ? Icon(
                          Icons.check_circle,
                          size: 18,
                          color: context.color.onPrimary,
                        )
                      : null,
                  side: BorderSide(
                    color: context.color.primary,
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
