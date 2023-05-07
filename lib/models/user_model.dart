class UserModel {
  int id;
  String name;
  String email;
  String password;
  String confirmPassword;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.confirmPassword,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['password_confirmation'];
    token = json['token'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,
      'token': token,
    };
  }
}
