import 'package:furniture_store_application/features/product/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_repository_provider.g.dart';

@riverpod
ProductLocalDataSource productLocalDataSource(Ref ref) {
  return ProductLocalDataSourceImplementation();
}

@riverpod
ProductRepository productRepository(Ref ref) {
  final localDataSource = ref.watch(productLocalDataSourceProvider);
  return ProductRepositoryImplementation(localDataSource);
}
