// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

class LoginModel {
  bool? status;
  String? message;
  String? token;
  bool? isSuperuser;
  UserDetails? userDetails;

  LoginModel({
    this.status,
    this.message,
    this.token,
    this.isSuperuser,
    this.userDetails,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        isSuperuser: json["is_superuser"],
        userDetails: json["user_details"] == null
            ? null
            : UserDetails.fromJson(json["user_details"]),
      );
}

class UserDetails {
  int? id;
  dynamic lastLogin;
  String? name;
  String? phone;
  String? address;
  String? mail;
  String? username;
  String? password;
  String? passwordText;
  int? admin;
  bool? isAdmin;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic branch;

  UserDetails({
    this.id,
    this.lastLogin,
    this.name,
    this.phone,
    this.address,
    this.mail,
    this.username,
    this.password,
    this.passwordText,
    this.admin,
    this.isAdmin,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.branch,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        lastLogin: json["last_login"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        mail: json["mail"],
        username: json["username"],
        password: json["password"],
        passwordText: json["password_text"],
        admin: json["admin"],
        isAdmin: json["is_admin"],
        isActive: json["is_active"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        branch: json["branch"],
      );
}
