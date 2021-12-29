class UserModel {
  late String id;
  late String name;
  late String email;

  UserModel({required this.name, required this.id, required this.email});

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
    };
  }

  static UserModel fromMap(Map<String, dynamic> map) {
    return UserModel(id: map["id"], name: map["name"], email: map["email"]);
  }
}
