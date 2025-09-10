import 'package:flutter/material.dart';

@immutable
class UserEntity {
  const UserEntity({
    required this.email,
    required this.name,
    this.id,
    this.phone,
    this.profileImage,
    this.memberSince,
    this.isActive = true,
  });

  final String? id;
  final String? email;
  final String? name;
  final String? phone;
  final String? profileImage;
  final DateTime? memberSince;
  final bool isActive;

  UserEntity copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? profileImage,
    DateTime? memberSince,
    bool? isActive,
  }) {
    return UserEntity(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      profileImage: profileImage ?? this.profileImage,
      memberSince: memberSince ?? this.memberSince,
      isActive: isActive ?? this.isActive,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserEntity &&
        (id != null && other.id != null
            ? id == other.id
            : email == other.email && name == other.name);
  }

  @override
  int get hashCode => id != null ? id.hashCode : Object.hash(email, name);
}
