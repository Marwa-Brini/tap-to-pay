class UserModel {
  final String? name;
  final String? email;
  final int pin;
  final int? id;
  final String? phone;

  UserModel({ this.name,  this.email, required this.pin,  this.id,  this.phone});

   factory UserModel.fromJson(Map<String , dynamic> json)=>UserModel(pin: json['pin'],
   name: json['name'],
   email: json['email'],
   phone:  json['phone'],
   id: json['id']
   );
}