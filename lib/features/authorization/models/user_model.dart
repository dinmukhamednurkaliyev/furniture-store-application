import 'package:flutter/widgets.dart';

@immutable
class UserModel {
  const UserModel({required this.email, required this.name});
  final String email;
  final String name;
}
