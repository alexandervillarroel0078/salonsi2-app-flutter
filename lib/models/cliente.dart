class Cliente {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String? photoUrl;

  Cliente({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    this.photoUrl,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      photoUrl: json['photo_url'],
    );
  }
}
