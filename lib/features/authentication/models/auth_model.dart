// To parse this JSON data, do
//
//     final authModel = authModelFromJson(jsonString);

import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  int? id;
  String? phone;
  String? status;
  String? token;

  AuthModel({
    this.id,
    this.phone,
    this.status,
    this.token,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        id: json["id"],
        phone: json["phone"],
        status: json["status"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "status": status,
        "token": token,
      };
}
