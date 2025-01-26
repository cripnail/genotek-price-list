enum PriceStatus {
  active,
  discount,
  inactive;

  factory PriceStatus.fromJson(bool? discountState) {
    if (discountState == null) return PriceStatus.inactive;
    return discountState ? PriceStatus.discount : PriceStatus.active;
  }
}
