import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/product.dart';

class GetCategoriesUsecase {
  const GetCategoriesUsecase(this._repository);
  final ProductRepository _repository;

  Future<Result<List<String>>> call() => _repository.getCategories();
}
