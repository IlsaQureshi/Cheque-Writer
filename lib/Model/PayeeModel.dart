// To parse this JSON data, do
//
//     final payeeModel = payeeModelFromJson(jsonString);

import 'dart:convert';

PayeeModel payeeModelFromJson(String str) => PayeeModel.fromJson(json.decode(str));

String payeeModelToJson(PayeeModel data) => json.encode(data.toJson());

class PayeeModel {
  PayeeModel({
    required this.fname,
    required this.middlename,
    required this.lname,
    required this.nickname,
    required this.dob,
    required this.phoneNumber,
    required this.email,
    required this.accountNumber,
    required this.sortCode,
    required this.bank,
    required this.address1,
    required this.address2,
    required this.address3,
    required this.city,
    required this.country,
    required this.postCode,
    required this.ownerid,
  });

  String fname;
  String middlename;
  String lname;
  String nickname;
  String dob;
  String phoneNumber;
  String email;
  int accountNumber;
  String sortCode;
  String bank;
  String address1;
  String address2;
  String address3;
  String city;
  String country;
  String postCode;
  String ownerid;

  factory PayeeModel.fromJson(Map<String, dynamic> json) => PayeeModel(
    fname: json["fname"],
    middlename: json["middlename"],
    lname: json["lname"],
    nickname: json["nickname"],
    dob: json["dob"],
    phoneNumber: json["phoneNumber"],
    email: json["email"],
    accountNumber: json["accountNumber"],
    sortCode: json["sortCode"],
    bank: json["bank"],
    address1: json["address1"],
    address2: json["address2"],
    address3: json["address3"],
    city: json["city"],
    country: json["country"],
    postCode: json["postCode"],
    ownerid: json["ownerid"],
  );

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "middlename": middlename,
    "lname": lname,
    "nickname": nickname,
    "dob": dob,
    "phoneNumber": phoneNumber,
    "email": email,
    "accountNumber": accountNumber,
    "sortCode": sortCode,
    "bank": bank,
    "address1": address1,
    "address2": address2,
    "address3": address3,
    "city": city,
    "country": country,
    "postCode": postCode,
    "ownerid": ownerid,
  };
}
