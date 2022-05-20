// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    required this.fname,
    required this.lname,
    required this.ismpass,
    required this.dob,
    required this.mpass,
    required this.transpass,
    required this.email,
  });

  String fname;
  String lname;
  bool ismpass;
  String dob;
  String mpass;
  String transpass;
  String email;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    fname: json["fname"],
    lname: json["lname"],
    ismpass: json["ismpass"],
    dob: json["dob"],
    mpass: json["mpass"],
    transpass: json["transpass"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "lname": lname,
    "ismpass": ismpass,
    "dob": dob,
    "mpass": mpass,
    "transpass": transpass,
    "email": email,
  };
}
