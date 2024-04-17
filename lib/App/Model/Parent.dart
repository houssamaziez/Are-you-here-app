class User {
  final int id;
  final String name;
  final String image;
  final String address;
  final int phone;
  final String email;
  final String isSee;
  final String role;
  final String tokenNotification;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.name,
    required this.image,
    required this.address,
    required this.phone,
    required this.email,
    required this.isSee,
    required this.role,
    required this.tokenNotification,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      address: json['address'] ?? 'No address provided', // Handle null values
      phone: json['phone'],
      email: json['email'],
      isSee: json['issee'],
      role: json['role'],
      tokenNotification: json['tokennotification'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
