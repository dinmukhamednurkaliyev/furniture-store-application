import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

part 'home_page_data.freezed.dart';
part 'home_page_data.g.dart';

@freezed
abstract class HomePageData with _$HomePageData {
  const factory HomePageData({
    required ProductState productState,
    required List<FeaturedOfferDisplayEntity> featuredOffers,
    required List<FurnitureEntity> featuredProducts,
  }) = _HomePageData;

  factory HomePageData.fromJson(Map<String, dynamic> json) =>
      _$HomePageDataFromJson(json);
}
