import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/application/application.dart';
import 'package:furniture_store_application/features/home/home.dart';
import 'package:go_router/go_router.dart';

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
                        context.pushNamed(ApplicationRoutes.profile.name);
                      },
                    ),
                    HomeSearchBarWidget(
                      onTap: () {},
                    ),
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
