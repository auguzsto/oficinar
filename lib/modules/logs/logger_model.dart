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

  factory LoggerModel.fromJson(Map<String, dynamic> json) {
    return LoggerModel(
      json['author'],
      json['describe'],
      json['created_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "author": author,
      "describe": describe,
      "created_at": createdAt,
    };
  }
}
