import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/features.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'special_offer_notifier.g.dart';

@riverpod
class SpecialOfferNotifier extends _$SpecialOfferNotifier {
  @override
  Future<SpecialOfferState> build() async {
    return const SpecialOfferState();
  }

  Future<void> fetchOffersByIds(List<String> ids) async {
    if (ids.isEmpty) {
      state = const AsyncValue.data(SpecialOfferState());
      return;
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final getOffersUsecase = ref.read(getOffersByIdsUsecaseProvider);
      final result = await getOffersUsecase(ids);

      return result.when(
        success: (data) => SpecialOfferState(offers: data),
        error: (failure) => throw Exception(failure.toString()),
      );
    });
  }

  Future<void> getApplicableOffers(FurnitureEntity product) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final getApplicableOffersUsecase = ref.read(
        getApplicableOffersUsecaseProvider,
      );
      final result = await getApplicableOffersUsecase(product: product);

      return result.when(
        success: (data) => SpecialOfferState(offers: data),
        error: (failure) => throw Exception(failure.toString()),
      );
    });
  }
}
