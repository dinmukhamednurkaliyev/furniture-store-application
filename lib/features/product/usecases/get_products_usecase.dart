import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/entities/entities.dart';
import 'package:furniture_store_application/features/product/repositories/repositories.dart';

class GetProductsUsecase {
  const GetProductsUsecase(this._repository);
  final ProductRepository _repository;

  Future<Result<List<FurnitureEntity>>> call() => _repository.getProducts();
}
