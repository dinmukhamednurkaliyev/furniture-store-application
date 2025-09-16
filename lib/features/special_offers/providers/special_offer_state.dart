import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

@immutable
class SpecialOfferState {
  const SpecialOfferState({
    this.offers = const [],
  });

  final List<SpecialOfferEntity> offers;

  SpecialOfferState copyWith({
    List<SpecialOfferEntity>? offers,
  }) {
    return SpecialOfferState(
      offers: offers ?? this.offers,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    const listEquals = DeepCollectionEquality();

    return other is SpecialOfferState &&
        listEquals.equals(other.offers, offers);
  }

  @override
  int get hashCode => const DeepCollectionEquality().hash(offers);
}
