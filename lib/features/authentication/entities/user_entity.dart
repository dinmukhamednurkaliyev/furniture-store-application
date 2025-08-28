import 'package:flutter/material.dart';

@immutable
class UserEntity {
  const UserEntity({required this.email, required this.name});
  final String? email;
  final String? name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity && email == other.email && name == other.name;

  @override
  int get hashCode => Object.hash(email, name);
}
