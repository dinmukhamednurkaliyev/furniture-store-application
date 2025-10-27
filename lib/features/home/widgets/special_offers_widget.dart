import 'dart:async';

import 'package:flutter/material.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class SpecialOffersWidget extends StatefulWidget {
  const SpecialOffersWidget({
    required this.offers,
    super.key,
  });

  final List<FeaturedOfferDisplayEntity> offers;

  @override
  State<SpecialOffersWidget> createState() => _SpecialOffersWidgetState();
}

class _SpecialOffersWidgetState extends State<SpecialOffersWidget> {
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.offers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.spacingValues.large,
      children: [
        SizedBox(
          height: 210,
          child: PageView.builder(
            controller: _pageController,
            itemCount: widget.offers.length,
            itemBuilder: (context, index) {
              final displayOffer = widget.offers[index];
              return _OfferCard(displayOffer: displayOffer);
            },
          ),
        ),
        if (widget.offers.length > 1)
          Center(
            child: _PageIndicators(
              controller: _pageController,
              itemCount: widget.offers.length,
              onIndicatorTapped: (index) {
                unawaited(
                  _pageController.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.displayOffer});

  final FeaturedOfferDisplayEntity displayOffer;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: context.paddingValues.hSmall,
      shape: RoundedRectangleBorder(
        borderRadius: context.radiusValues.circularLarge,
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 2,
      child: InkWell(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                context.primaryColor,
                context.primaryColor.withValues(alpha: 0.8),
              ],
            ),
          ),
          child: Stack(
            children: [
              _OfferDetails(offer: displayOffer.offer),
              const _DecorativeCircles(),
              _ProductImage(product: displayOffer.product),
            ],
          ),
        ),
      ),
    );
  }
}

class _OfferDetails extends StatelessWidget {
  const _OfferDetails({required this.offer});

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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.paddingValues.large,
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

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.titleMedium?.copyWith(
                    color: context.onPrimaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: context.onPrimaryColor,
                foregroundColor: context.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: context.radiusValues.circularMedium,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: context.paddingValues.large,
                  vertical: context.paddingValues.xsmall,
                ),
              ),
              child: const Text(
                'Shop now',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
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
            backgroundColor: context.onPrimaryColor.withValues(alpha: 0.12),
          ),
        ),
        Positioned(
          right: -20,
          bottom: -20,
          child: CircleAvatar(
            radius: 60,
            backgroundColor: context.onPrimaryColor.withValues(alpha: 0.10),
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
          child: product.imageUrl.when(
            local: (path) => Image.asset(
              path,
              height: 180,
              fit: BoxFit.contain,
            ),
            remote: (url) => Image.network(
              url,
              height: 180,
              fit: BoxFit.contain,
            ),
          ),
        ),
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
