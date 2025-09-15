import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/product/repositories/repositories.dart';

class ToggleFavoriteUsecase {
  const ToggleFavoriteUsecase(this._repository);
  final ProductRepository _repository;

  Future<Result<void>> call(String productId) =>
      _repository.toggleFavorite(productId);
}
