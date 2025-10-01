import 'package:furniture_store_application/features/product/repositories/repositories.dart';
import 'package:furniture_store_application/features/product/sources/sources.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_data_providers.g.dart';

@riverpod
ProductLocalDataSource productLocalDataSource(Ref ref) {
  return ProductLocalDataSourceImplementation();
}

@riverpod
ProductRepository productRepository(Ref ref) {
  final localDataSource = ref.watch(productLocalDataSourceProvider);
  return ProductRepositoryImplementation(localDataSource);
}
