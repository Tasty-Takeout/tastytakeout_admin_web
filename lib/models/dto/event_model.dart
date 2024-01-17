class EventModel {
  final String name;
  final String description;
  final String imageUrl;
  List<String> vouchers = [];

  EventModel({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.vouchers,
  });
}