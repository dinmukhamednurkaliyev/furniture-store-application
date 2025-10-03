import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

part 'special_offer_state.freezed.dart';

@freezed
abstract class SpecialOfferState with _$SpecialOfferState {
  const factory SpecialOfferState({
    @Default([]) List<SpecialOfferEntity> offers,
  }) = _SpecialOfferState;
}
