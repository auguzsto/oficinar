import 'package:oficinar/core/model.dart';

class LoggerModel implements Model {
  String author;
  String describe;
  @override
  String? createdAt;

  @override
  String? deletedAt;

  @override
  int? id;

  @override
  String? updatedAt;

  LoggerModel(
    this.author,
    this.describe,
    this.createdAt,
  );

  Map<String, dynamic> toJson() {
    return {
      "author": author,
      "describe": describe,
      "created_at": createdAt,
    };
  }
}
