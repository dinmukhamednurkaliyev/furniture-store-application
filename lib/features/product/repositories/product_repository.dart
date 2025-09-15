import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';

abstract interface class ProductRepository {
  Future<Result<List<FurnitureEntity>>> getProducts();
  Future<Result<FurnitureEntity>> getProduct(String id);
  Future<Result<List<String>>> getCategories();
  Future<Result<List<FurnitureEntity>>> getFeaturedProducts();
  Future<Result<void>> toggleFavorite(String id);
}

class ProductRepositoryImplementation implements ProductRepository {
  const ProductRepositoryImplementation(this._localDataSource);

  final ProductLocalDataSource _localDataSource;

  @override
  Future<Result<List<FurnitureEntity>>> getProducts() =>
      Result.guardAsync(_localDataSource.getProducts);

  @override
  Future<Result<FurnitureEntity>> getProduct(String id) =>
      Result.guardAsync(() => _localDataSource.getProduct(id));

  @override
  Future<Result<List<String>>> getCategories() {
    return Result.guardAsync(() async {
      final products = await _localDataSource.getProducts();
      final categories = <String>{'All'};
      for (final item in products) {
        categories.add(item.category);
      }
      return categories.toList()..sort();
    });
  }

  @override
  Future<Result<List<FurnitureEntity>>> getFeaturedProducts() {
    return Result.guardAsync(() async {
      final products = await _localDataSource.getProducts();
      return products
          .where(
            (item) =>
                item.price >= 599 ||
                item.isFavorite ||
                item.category == 'Sofa' ||
                item.category == 'Bed',
          )
          .take(5)
          .toList();
    });
  }

  @override
  Future<Result<void>> toggleFavorite(String id) {
    return Result.guardAsync(() async {
      final product = await _localDataSource.getProduct(id);
      await _localDataSource.updateProduct(
        product.copyWith(isFavorite: !product.isFavorite),
      );
    });
  }
}
