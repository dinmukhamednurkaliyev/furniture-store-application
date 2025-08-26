import 'package:flutter/widgets.dart';

@immutable
class UserEntity {
  const UserEntity({required this.email, required this.name});
  final String email;
  final String name;
}
