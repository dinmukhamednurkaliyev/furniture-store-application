import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';

class HomeBodyWidget extends ConsumerWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productState = ref.watch(productNotifierProvider);

    return productState.when(
      data: (state) => _buildProductView(context, ref, state),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }

  Widget _buildProductView(
    BuildContext context,
    WidgetRef ref,
    ProductState state,
  ) {
    final filteredList = state.filteredProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: _CategoryFilter(
            categories: state.categories,
            selectedCategory: state.selectedCategory,
            onCategorySelected: (category) {
              ref
                  .read(productNotifierProvider.notifier)
                  .selectCategory(category);
            },
          ),
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
            style: context.textTheme.titleMedium?.copyWith(
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
                  selected: selectedCategory == category,
                  onSelected: (isSelected) {
                    if (isSelected) {
                      onCategorySelected(category);
                    }
                  },
                  selectedColor: context.primaryColor,
                  labelStyle: TextStyle(
                    color: selectedCategory == category
                        ? context.colorScheme.onPrimary
                        : context.colorScheme.onSurface,
                  ),
                  showCheckmark: false,
                  avatar: isSelected
                      ? Icon(
                          Icons.check_circle,
                          size: 18,
                          color: context.colorScheme.onPrimary,
                        )
                      : null,
                  side: BorderSide(
                    color: context.primaryColor,
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
