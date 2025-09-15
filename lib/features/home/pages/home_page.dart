import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/profile/profile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: context.paddingValues.allLarge,
              sliver: SliverToBoxAdapter(
                child: Column(
                  spacing: 20,
                  children: [
                    HomeHeaderWidget(
                      onTap: () {
                        ProfileRoute.push(context);
                      },
                    ),
                    HomeSearchBarWidget(
                      onTap: () {},
                    ),
                    const HomeBodyWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
