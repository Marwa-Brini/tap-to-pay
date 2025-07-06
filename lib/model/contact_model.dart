class ContactModel {
  final String name;
  final String rib;
  final int? id;
  final int bankID;
  final String? bankImage;

  ContactModel({
    required this.name,
    required this.bankID,
    required this.rib,
    this.id,
    this.bankImage,
  });

  factory ContactModel.fromJson(Map<String, dynamic> json) => ContactModel(
    bankID: json['bankID'],
    name: json['name'],
    rib: json['rib'],
    id: json['id'],
    bankImage: json['image'],
  );

  Map<String, dynamic> toJson() => {'bankID': bankID, 'name': name, 'rib': rib};
}
