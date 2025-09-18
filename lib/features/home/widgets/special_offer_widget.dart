import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class SpecialOffersWidget extends ConsumerStatefulWidget {
  const SpecialOffersWidget({super.key});

  @override
  ConsumerState<SpecialOffersWidget> createState() =>
      _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends ConsumerState<SpecialOffersWidget> {
  final _pageController = PageController(viewportFraction: 0.9);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round() ?? 0;
      if (_currentPage != page) {
        setState(() {
          _currentPage = page;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final featuredOffersState = ref.watch(featuredOffersProvider);

    return featuredOffersState.when(
      data: (offers) {
        if (offers.isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: context.paddingValues.large,
          children: [
            Text(
              'Special Offers',
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 180,
              child: PageView.builder(
                controller: _pageController,
                itemCount: offers.length,
                itemBuilder: (context, index) {
                  final displayOffer = offers[index];
                  return _OfferCard(displayOffer: displayOffer);
                },
              ),
            ),
            if (offers.length > 1)
              Center(
                child: _PageIndicators(
                  itemCount: offers.length,
                  currentPage: _currentPage,
                  onIndicatorTapped: (index) {
                    _pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('Error: $error')),
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.displayOffer});

  final FeaturedOfferDisplayEntity displayOffer;

  @override
  Widget build(BuildContext context) {
    final offer = displayOffer.offer;
    final product = displayOffer.product;

    return InkWell(
      onTap: () {},
      borderRadius: context.radiusValues.circularLarge,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: context.radiusValues.circularLarge,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              context.primaryColor,
              context.primaryColor.withValues(alpha: 0.8),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: context.radiusValues.circularLarge,
          child: Stack(
            children: [
              Padding(
                padding: context.paddingValues.allLarge,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${offer.discountPercentage.toInt()}% OFF',
                      style: context.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    context.spacingValues.verticalSmall,
                    Text(
                      offer.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -30,
                bottom: -20,
                child: IgnorePointer(
                  child: Opacity(
                    opacity: 0.8,
                    child: Image.asset(
                      product.imageUrl,
                      height: 160,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageIndicators extends StatelessWidget {
  const _PageIndicators({
    required this.itemCount,
    required this.currentPage,
    required this.onIndicatorTapped,
  });

  final int itemCount;
  final int currentPage;
  final ValueChanged<int> onIndicatorTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => _Indicator(
          isActive: currentPage == index,
          onTap: () => onIndicatorTapped(index),
        ),
      ),
    );
  }
}

class _Indicator extends StatelessWidget {
  const _Indicator({
    required this.isActive,
    required this.onTap,
  });

  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      mouseCursor: SystemMouseCursors.click,
      borderRadius: context.radiusValues.circularLarge,
      overlayColor: WidgetStateProperty.all(
        context.primaryColor.withValues(alpha: 0.1),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.paddingValues.xsmall,
          vertical: context.paddingValues.small,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: context.spacingValues.small,
          width: isActive
              ? context.spacingValues.xxlarge
              : context.spacingValues.small,
          decoration: BoxDecoration(
            color: isActive
                ? context.primaryColor
                : context.colorScheme.surfaceContainerHighest,
            borderRadius: context.radiusValues.circularMedium,
          ),
        ),
      ),
    );
  }
}
