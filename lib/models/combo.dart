class Combo {
  final int id;
  final String name;
  final String description;
  final double price;
  final String? imagePath;

  Combo({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imagePath,
  });

  factory Combo.fromJson(Map<String, dynamic> json) {
    return Combo(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      imagePath: json['image_path'],
    );
  }
}
