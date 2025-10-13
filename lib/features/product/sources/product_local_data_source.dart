import 'dart:async';

import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';

abstract interface class ProductLocalDataSource {
  Future<List<FurnitureEntity>> getProducts();
  Future<FurnitureEntity> getProduct(String id);
  Future<void> updateProduct(FurnitureEntity product);
}

class ProductLocalDataSourceImplementation implements ProductLocalDataSource {
  ProductLocalDataSourceImplementation()
      : _products = kMockFurnitureData
            .map((product) => product.copyWith())
            .toList();

  final List<FurnitureEntity> _products;

  static const _kShortDelay = Duration(milliseconds: 50);
  static const _kMediumDelay = Duration(milliseconds: 100);
  static const _kLongDelay = Duration(milliseconds: 300);

  @override
  Future<List<FurnitureEntity>> getProducts() async {
    await Future.delayed(_kLongDelay);
    return _products;
  }

  @override
  Future<FurnitureEntity> getProduct(String id) async {
    await Future.delayed(_kMediumDelay);
    final product = _products.firstWhere(
      (product) => product.id == id,
      orElse: () => throw const ApplicationException.serverException(message: 'Product not found'),
    );
    return product;
  }

  @override
  Future<void> updateProduct(FurnitureEntity product) async {
    await Future.delayed(_kShortDelay);
    final index = _products.indexWhere(
      (eachProduct) => eachProduct.id == product.id,
    );
    if (index != -1) {
      _products[index] = product;
    } else {
      throw ApplicationException.cacheException(
        message: 'Product with id ${product.id} not found for update.',
      );
    }
  }
}