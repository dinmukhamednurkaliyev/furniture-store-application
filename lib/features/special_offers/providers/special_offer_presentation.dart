import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

final specialOfferNotifierProvider =
    AsyncNotifierProvider<SpecialOfferNotifier, SpecialOfferState>(
      SpecialOfferNotifier.new,
    );

final featuredOffersProvider = FutureProvider<List<FeaturedOfferDisplayEntity>>(
  (ref) async {
    final getFeaturedOffers = ref.watch(getFeaturedOffersUsecaseProvider);
    final result = await getFeaturedOffers();

    return result.when(
      success: (offers) => offers,
      error: (failure) => throw ApplicationException(message: failure.message),
    );
  },
);
