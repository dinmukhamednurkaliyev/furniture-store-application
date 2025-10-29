import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:furniture_store_application/features/cart/cart.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/profile/profile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<CartState>(cartProvider, (previous, next) {
      if (previous == null) return;

      final wasAdding = previous.addingIds.isNotEmpty && next.addingIds.isEmpty;

      final wasRemoving =
          previous.removingIds.isNotEmpty && next.removingIds.isEmpty;

      if (wasAdding) {
        final addedItem = next.items.firstWhere(
          (nItem) => !previous.items.any(
            (pItem) => pItem.furniture.id == nItem.furniture.id,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: const Text('Added to cart'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.green,
              action: SnackBarAction(
                label: 'Undo',
                textColor: Colors.white,
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .toggleCartItem(addedItem.furniture);
                },
              ),
            ),
          );
      }

      if (wasRemoving) {
        final removedItem = previous.items.firstWhere(
          (pItem) => !next.items.any(
            (nItem) => nItem.furniture.id == pItem.furniture.id,
          ),
        );

        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            SnackBar(
              content: const Text('Removed from cart'),
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              backgroundColor: Colors.red,
              action: SnackBarAction(
                label: 'Undo',
                textColor: Colors.white,
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .toggleCartItem(removedItem.furniture);
                },
              ),
            ),
          );
      }
    });

    final authenticationState = ref.watch(authenticationProvider);

    final homeDataState = ref.watch(homePageDataProvider);

    return Scaffold(
      body: SafeArea(
        child: homeDataState.when(
          loading: () => const Center(child: CircularProgressIndicator()),

          error: (error, stack) => Center(child: Text('Error: $error')),

          data: (homeData) {
            final user = authenticationState.value;

            final productData = homeData.productState;

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: context.paddingValues.allLarge,

                  sliver: SliverToBoxAdapter(
                    child: Column(
                      spacing: context.spacingValues.medium,

                      children: [
                        HomeHeaderWidget(
                          displayName: user?.name ?? 'Guest',

                          profileImage: user?.profileImage,

                          onTap: () => ProfileRoute.push(context),
                        ),

                        HomeSearchBarWidget(onTap: () {}),

                        HomeBodyWidget(
                          categories: productData.categories,

                          selectedCategory: productData.selectedCategory,

                          featuredOffers: homeData.featuredOffers,

                          featuredProducts: homeData.featuredProducts,

                          allProducts: productData.filteredProducts,

                          onCategorySelected: (category) {
                            ref
                                .read(productProvider.notifier)
                                .selectCategory(category);
                          },

                          onFavoriteToggle: (productId) {
                            ref
                                .read(productProvider.notifier)
                                .toggleFavorite(productId);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
