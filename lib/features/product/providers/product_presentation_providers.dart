import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/product.dart';

final productNotifierProvider =
    AsyncNotifierProvider<ProductNotifier, List<FurnitureEntity>>(
  ProductNotifier.new,
);
