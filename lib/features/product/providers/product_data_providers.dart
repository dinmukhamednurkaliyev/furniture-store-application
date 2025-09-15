import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:furniture_store_application/features/product/product.dart';

final productLocalDataSourceProvider = Provider<ProductLocalDataSource>((ref) {
  return ProductLocalDataSourceImplementation();
});

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  final localDataSource = ref.watch(productLocalDataSourceProvider);
  return ProductRepositoryImplementation(localDataSource);
});

final specialOfferRepositoryProvider = Provider<ISpecialOfferRepository>((ref) {
  return MockSpecialOfferRepository();
});
