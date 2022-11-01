// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Datamodel welcomeFromJson(String str) => Datamodel.fromJson(json.decode(str));

String welcomeToJson(Datamodel data) => json.encode(data.toJson());

class Datamodel {
  Datamodel({
    required this.email,
    required this.password,
  });

  String email;
  String password;

  factory Datamodel.fromJson(Map<String, dynamic> json) => Datamodel(
        email: json["email"] == null ? null : json["email"],
        password: json["password"] == null ? null : json["password"],
      );

  Map<String, dynamic> toJson() => {
        "email": email == null ? null : email,
        "password": password == null ? null : password,
      };
}
