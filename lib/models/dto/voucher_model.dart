class VoucherModel {
  final String code;
  final String name;
  final String description;
  final String endDate;
  final double discountAmount;
  final String discountType;
  final double maxPrice;
  final double minPrice;

  VoucherModel({
    required this.code,
    required this.name,
    required this.description,
    required this.endDate,
    required this.discountAmount,
    required this.discountType,
    required this.maxPrice,
    required this.minPrice,
  });

  static VoucherModel fromJson(Map<String, dynamic> voucher) {
    return VoucherModel(
      code: voucher['code'],
      name: voucher['name'],
      description: voucher['description'],
      endDate: voucher['end'],
      discountAmount: voucher['discount_amount'].toDouble(),
      discountType: voucher['discount_type'],
      maxPrice: voucher['max_price'].toDouble(),
      minPrice: voucher['min_price'].toDouble(),
    );
  }

}