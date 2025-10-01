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
    final authState = ref.watch(authenticationProvider);
    final productState = ref.watch(productProvider);

    return Scaffold(
      body: SafeArea(
        child: productState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stack) => Center(child: Text('Error: $error')),
          data: (productData) {
            final user = authState.value;

            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: context.paddingValues.allLarge,
                  sliver: SliverToBoxAdapter(
                    child: Column(
                      spacing: 20,
                      children: [
                        HomeHeaderWidget(
                          displayName: user?.name ?? 'Guest',
                          profileImageUrl: user?.profileImage,
                          onTap: () => ProfileRoute.push(context),
                        ),
                        HomeSearchBarWidget(onTap: () {}),

                        HomeBodyWidget(
                          categories: productData.categories,
                          selectedCategory: productData.selectedCategory,
                          onCategorySelected: (category) {
                            ref
                                .read(productProvider.notifier)
                                .selectCategory(category);
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
