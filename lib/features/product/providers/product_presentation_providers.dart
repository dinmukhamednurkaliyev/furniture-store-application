import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/providers/product_notifier.dart';
import 'package:furniture_store_application/features/product/providers/product_state.dart';

final productNotifierProvider =
    AsyncNotifierProvider<ProductNotifier, ProductState>(
  ProductNotifier.new,
);
