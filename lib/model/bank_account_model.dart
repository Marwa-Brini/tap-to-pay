class BankAccountModel {
  final String rib;
  final double balance;
  final int? id;
  final String name;
  final String username;
  final String? image;
  final String? email;
  final String? phone;

  BankAccountModel({
    required this.rib,
    this.email,
    required this.balance,
    this.id,
    required this.name,
    this.phone,
    required this.username,
    this.image,
  });

  factory BankAccountModel.fromJson(Map<String, dynamic> json) =>
      BankAccountModel(
        rib: json['rib'],
        email: json['email'],
        phone: json['phone'],
        name: json['name'],
        username: json['username'],
        balance: json['balance'],
        id: json['id'],
        image: json['image'],
      );
}
