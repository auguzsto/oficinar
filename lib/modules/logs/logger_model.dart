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

  LoggerModel({
    required this.author,
    required this.describe,
    this.createdAt,
  });

  factory LoggerModel.fromJson(Map<String, dynamic> json) {
    return LoggerModel(
      author: json['author'],
      describe: json['describe'],
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
