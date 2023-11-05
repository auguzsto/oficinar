import 'package:oficinar/core/model.dart';

class UserModel implements Model {
  String? username;
  String? password;
  String? firstName;
  String? lastName;

  @override
  String? createdAt;

  @override
  String? deletedAt;

  @override
  int? id;

  @override
  String? updatedAt;

  UserModel({
    this.id,
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "username": username,
      "password": password,
      "first_name": firstName,
      "last_name": lastName,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "deleted_at": deletedAt,
    };
  }
}
