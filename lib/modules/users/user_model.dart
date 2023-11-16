import 'package:oficinar/core/model.dart';

class UserModel extends Model {
  String? username;
  String? password;

  UserModel({
    super.id,
    this.username,
    this.password,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) {
    try {
      if (username!.isEmpty) {
        throw Exception("Campo login deve ser preenchido.");
      }

      if (password!.isEmpty) {
        throw Exception("Campo senha deve ser preenchido.");
      }
    } catch (e) {
      rethrow;
    }
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      password: json['password'],
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
      "created_at": createdAt,
      "updated_at": updatedAt,
      "deleted_at": deletedAt,
    };
  }
}
