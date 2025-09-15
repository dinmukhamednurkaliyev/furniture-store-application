class GetDiscountedPriceUsecase {
  double call(double price, double discountPercentage) {
    if (discountPercentage < 0 || discountPercentage > 100) {
      throw ArgumentError('Discount percentage must be between 0 and 100.');
    }
    return price - (price * (discountPercentage / 100));
  }
}
