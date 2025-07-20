class UserModel {
  final String? name;
  final String? email;
  final int pin;
  final int? id;
  final String? phone;
  String? image;

  UserModel({
    this.name,
    this.email,
    required this.pin,
    this.id,
    this.phone,
    this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    pin: json['pin'],
    name: json['name'],
    email: json['email'],
    phone: json['phone'],
    id: json['id'],
    image: json['image'],
  );
}
