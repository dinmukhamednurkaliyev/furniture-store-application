import 'package:furniture_store_application/core/core.dart';
import 'package:furniture_store_application/features/special_offers/special_offers.dart';

class GetOffersByIdsUsecase {
  const GetOffersByIdsUsecase(this._repository);
  final SpecialOfferRepository _repository;

  Future<Result<List<SpecialOfferEntity>>> call(List<String> ids) =>
      _repository.getOffersByIds(ids);
}
