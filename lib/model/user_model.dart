class UserModel {
  String name;
  String email;
  String password;
  String image;
  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        image: json["image"],
      );
}
