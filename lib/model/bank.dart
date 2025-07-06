class BankModel {
  final String url;
  final String name;
  final int code;
  final String image;

  BankModel({
    required this.url,
    required this.name,
    required this.code,
    required this.image,
  });

  factory BankModel.fromJson(Map<String, dynamic> json) => BankModel(
    url: json['url'],
    name: json['name'],
    code: json['id'],
    image: json['image'],
  );
  Map<String, dynamic> toJson() => {
    'name': name,
    'url': url,
    'image': image,
    'id': code,
  };
}
