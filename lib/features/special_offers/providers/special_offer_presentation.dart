import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'special_offer_presentation.g.dart';

@riverpod
Future<List<FeaturedOfferDisplayEntity>> featuredOffers(Ref ref) async {
  final getFeaturedOffers = ref.watch(getFeaturedOffersUsecaseProvider);
  final result = await getFeaturedOffers();

  return result.when(
    success: (offers) => offers,
    error: (failure) => throw Exception(failure.message),
  );
}
