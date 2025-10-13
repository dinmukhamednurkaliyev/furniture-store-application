import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/authentication/authentication.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/profile/profile.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
