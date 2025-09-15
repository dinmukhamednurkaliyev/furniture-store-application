import 'package:flutter/material.dart';

@immutable
class FurnitureEntity {
  const FurnitureEntity({
    required this.id,
    required this.name,
    required this.category,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.images,
    required this.colors,
    this.specialOfferIds = const [],
    this.isFavorite = false,
  });

  final String id;
  final String name;
  final String category;
  final String description;
  final double price;
  final String imageUrl;
  final List<String> images;
  final List<String> colors;
  final bool isFavorite;
  final List<String> specialOfferIds;

  bool get hasSpecialOffer => specialOfferIds.isNotEmpty;

  FurnitureEntity copyWith({
    String? id,
    String? name,
    String? category,
    String? description,
    double? price,
    String? imageUrl,
    List<String>? images,
    List<String>? colors,
    bool? isFavorite,
    List<String>? specialOfferIds,
  }) {
    return FurnitureEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      images: images ?? this.images,
      colors: colors ?? this.colors,
      isFavorite: isFavorite ?? this.isFavorite,
      specialOfferIds: specialOfferIds ?? this.specialOfferIds,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FurnitureEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
