class Promotion {
  final int id;
  final String name;
  final String description;
  final double discountPercentage;
  final String startDate;
  final String endDate;
  final bool active;

  Promotion({
    required this.id,
    required this.name,
    required this.description,
    required this.discountPercentage,
    required this.startDate,
    required this.endDate,
    required this.active,
  });

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      discountPercentage: double.parse(json['discount_percentage'].toString()),
      startDate: json['start_date'],
      endDate: json['end_date'],
      active: json['active'] == true,
    );
  }
}
