import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

final specialOfferNotifierProvider =
    AsyncNotifierProvider<SpecialOfferNotifier, SpecialOfferState>(
      SpecialOfferNotifier.new,
    );
