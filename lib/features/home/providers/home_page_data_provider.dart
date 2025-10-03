import 'package:furniture_store_application/features/home/home.dart';
import 'package:furniture_store_application/features/product/product.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_page_data_provider.g.dart';

@riverpod
Future<HomePageData> homePageData(Ref ref) async {
  final (productState, featuredOffers) = await (
    ref.watch(productProvider.future),
    ref.watch(featuredOffersProvider.future),
  ).wait;

  final featuredProducts = productState.products
      .where(
        (item) =>
            item.price >= 599 ||
            item.isFavorite ||
            item.category == 'Sofa' ||
            item.category == 'Bed',
      )
      .take(5)
      .toList();

  return HomePageData(
    productState: productState,
    featuredOffers: featuredOffers,
    featuredProducts: featuredProducts,
  );
}
