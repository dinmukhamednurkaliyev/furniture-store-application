import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/.generated/assets.gen.dart';

part 'application_image.freezed.dart';

@freezed
abstract class ImageEntity with _$ApplicationImage {
  const factory ImageEntity.local(AssetGenImage asset) = _Local;
  const factory ImageEntity.remote(String url) = _Remote;
}
