import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class SpecialOffersWidget extends ConsumerStatefulWidget {
  const SpecialOffersWidget({super.key});

  @override
  ConsumerState<SpecialOffersWidget> createState() =>
      _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends ConsumerState<SpecialOffersWidget> {
  final _pageController = PageController(viewportFraction: 0.9);

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
          spacing: context.spacingValues.large,
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
                  controller: _pageController,
                  itemCount: offers.length,
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
    return InkWell(
      onTap: () {
        // TODO: Navigate to product page
      },
      borderRadius: context.radiusValues.circularLarge,
      child: Container(
        margin: context.paddingValues.hSmall,
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
              _OfferContent(offer: displayOffer.offer),
              const _DecorativeCircles(),
              _ProductImage(product: displayOffer.product),
              _OfferTag(offer: displayOffer.offer),
            ],
          ),
        ),
      ),
    );
  }
}

class _OfferContent extends StatelessWidget {
  const _OfferContent({required this.offer});

  final SpecialOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.paddingValues.allLarge,
      child: FractionallySizedBox(
        widthFactor: 0.6,
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${offer.discountPercentage.toInt()}% OFF',
              style: context.headlineMedium?.copyWith(
                color: context.onPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            context.spacingValues.verticalSmall,
            Text(
              offer.description,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.titleMedium?.copyWith(
                color: context.onPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DecorativeCircles extends StatelessWidget {
  const _DecorativeCircles();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: -30,
          bottom: -30,
          child: CircleAvatar(
            radius: 100,
            backgroundColor: context.onPrimaryColor.withValues(alpha: 0.05),
          ),
        ),
        Positioned(
          right: -20,
          bottom: -20,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: context.onPrimaryColor.withValues(alpha: 0.07),
          ),
        ),
      ],
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({required this.product});

  final FurnitureEntity product;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: -30,
      bottom: -20,
      child: IgnorePointer(
        child: Opacity(
          opacity: 0.8,
          child: Image.asset(
            product.imageUrl,
            height: 180,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

class _OfferTag extends StatelessWidget {
  const _OfferTag({required this.offer});

  final SpecialOfferEntity offer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.paddingValues.medium,
        horizontal: context.paddingValues.large,
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: context.paddingValues.small,
              vertical: context.paddingValues.xsmall,
            ),
            decoration: BoxDecoration(
              color: context.onPrimaryColor,
              borderRadius: context.radiusValues.circularXLarge,
            ),
            child: Text(
              offer.name,
              style: context.bodySmall?.copyWith(
                color: context.primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PageIndicators extends AnimatedWidget {
  const _PageIndicators({
    required this.controller,
    required this.itemCount,
    required this.onIndicatorTapped,
  }) : super(listenable: controller);

  final PageController controller;
  final int itemCount;
  final ValueChanged<int> onIndicatorTapped;

  @override
  Widget build(BuildContext context) {
    final page = controller.page?.round() ?? 0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => _Indicator(
          isActive: page == index,
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
          curve: Curves.easeOut,
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
