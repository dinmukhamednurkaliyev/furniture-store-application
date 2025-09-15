import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

abstract interface class SpecialOfferRepository {
  Future<Result<List<SpecialOfferEntity>>> getOffersByIds(List<String> ids);
}

class SpecialOfferRepositoryImplementation implements SpecialOfferRepository {
  const SpecialOfferRepositoryImplementation(this._localDataSource);
  final SpecialOfferLocalDataSource _localDataSource;

  @override
  Future<Result<List<SpecialOfferEntity>>> getOffersByIds(List<String> ids) {
    return Result.guardAsync(() => _localDataSource.getOffersByIds(ids));
  }
}
