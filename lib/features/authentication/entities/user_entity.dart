import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/core/core.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
abstract class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String? email,
    required String? name,
    String? id,
    String? phone,
    ImageEntity? profileImage,
    DateTime? memberSince,
    @Default(true) bool isActive,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);
}
