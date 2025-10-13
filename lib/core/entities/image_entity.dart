import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_entity.freezed.dart';
part 'image_entity.g.dart';

@freezed
sealed class ImageEntity with _$ImageEntity {
  const factory ImageEntity.local(String path) = _Local;
  const factory ImageEntity.remote(String url) = _Remote;

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);
}