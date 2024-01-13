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
}