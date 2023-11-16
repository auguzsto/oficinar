class Model {
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Model({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Model.fromJson(Map<String, dynamic> json) {
    return Model();
  }
}
