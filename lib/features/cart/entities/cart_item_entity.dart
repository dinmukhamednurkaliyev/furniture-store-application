import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:furniture_store_application/features/product/product.dart';

part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

@freezed
abstract class CartItemEntity with _$CartItemEntity {
  const factory CartItemEntity({
    required FurnitureEntity furniture,
    required int quantity,
    required String selectedColor,
  }) = _CartItemEntity;
  const CartItemEntity._();

  factory CartItemEntity.fromJson(Map<String, dynamic> json) =>
      _$CartItemEntityFromJson(json);

  double get totalPrice {
    if (furniture.hasSpecialOffer && furniture.discountedPrice != null) {
      return furniture.discountedPrice! * quantity;
    }
    return furniture.price * quantity;
  }

  double get unitPrice {
    if (furniture.hasSpecialOffer) {
      return furniture.discountedPrice!;
    }
    return furniture.price;
  }
}
