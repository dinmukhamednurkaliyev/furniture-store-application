import 'package:furniture_store_application/features/special_offers/special_offers.dart';

final offers = [
  SpecialOfferEntity(
    id: 'summer_sale',
    discountPercentage: 15,
    title: 'Summer Sale',
    description: '15% off on selected items.',
    startDate: DateTime.now().subtract(const Duration(days: 10)),
    endDate: DateTime.now().add(const Duration(days: 20)),
    applicableCategories: const ['Chair', 'Sofa', 'Table'],
  ),
  SpecialOfferEntity(
    id: 'storage_special',
    discountPercentage: 25,
    title: 'Storage Solutions',
    description: '25% off on all storage items.',
    startDate: DateTime.now().subtract(const Duration(days: 1)),
    endDate: DateTime.now().add(const Duration(days: 30)),
    minimumPurchaseAmount: 599,
    applicableCategories: const ['Storage'],
  ),
  SpecialOfferEntity(
    id: 'premium_discount',
    discountPercentage: 30,
    title: 'Premium Furniture Deal',
    description: '30% off for premium members.',
    startDate: DateTime.now().subtract(const Duration(days: 1)),
    endDate: DateTime.now().add(const Duration(days: 30)),
    minimumPurchaseAmount: 500,
  ),
];
