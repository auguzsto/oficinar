import 'package:oficinar/core/model.dart';

class ConsumersModel extends Model {
  String? fullName;
  String? email;
  String? cep;
  String? address;
  String? phone;
  String? phone2;
  String? phone3;

  ConsumersModel({
    this.fullName,
    this.email,
    this.cep,
    this.address,
    this.phone,
    this.phone2,
    this.phone3,
    super.id,
    super.createdAt,
    super.updatedAt,
    super.deletedAt,
  }) {
    try {
      if (fullName!.isEmpty || fullName!.length < 5) {
        throw Exception("Necessário preencher o nome completo do cliente");
      }
      if (email!.isEmpty || !email!.contains(RegExp(r'@'))) {
        throw Exception("Necessário preencher o email do cliente");
      }
      if (cep!.isEmpty || cep!.length != 9) {
        throw Exception("Necessário preencher o CEP do cliente");
      }
      if (address!.isEmpty) {
        throw Exception("Necessário preencher o endereço completo do cliente");
      }
      if (phone!.isEmpty) {
        throw Exception(
            "Necessário preencher o número para contato do cliente");
      }
    } catch (e) {
      rethrow;
    }
  }

  factory ConsumersModel.fromJson(Map<String, dynamic> json) {
    return ConsumersModel(
      id: json['id'],
      fullName: json['full_name'],
      email: json['email'],
      cep: json['cep'],
      address: json['address'],
      phone: json['phone'],
      phone2: json['phone2'],
      phone3: json['phone3'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "full_name": fullName,
      "email": email,
      "cep": cep,
      "address": address,
      "phone": phone,
      "phone2": phone2,
      "phone3": phone3,
      "created_at": createdAt,
      "updated_at": updatedAt,
      "deleted_at": deletedAt,
    };
  }
}
