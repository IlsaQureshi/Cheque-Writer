// To parse this JSON data, do
//
//     final allpayeesModel = allpayeesModelFromJson(jsonString);

import 'dart:convert';

AllpayeesModel allpayeesModelFromJson(String str) => AllpayeesModel.fromJson(json.decode(str));

String allpayeesModelToJson(AllpayeesModel data) => json.encode(data.toJson());

class AllpayeesModel {
  AllpayeesModel({
    required this.key,
    required this.payee,
  });

  String key;
  Payee payee;

  factory AllpayeesModel.fromJson(Map<String, dynamic> json) => AllpayeesModel(
    key: json["key"],
    payee: Payee.fromJson(json["payee"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "payee": payee.toJson(),
  };
}

class Payee {
  Payee({
    required this.country,
    required this.fname,
    required this.address3,
    required this.address2,
    required this.city,
    required this.address1,
    required this.middlename,
    required this.accountNumber,
    required this.ownerid,
    required this.sortCode,
    required this.bank,
    required this.lname,
    required this.phoneNumber,
    required this.dob,
    required this.nickname,
    required this.postCode,
    required this.email,
    required this.selected
  });

  String country;
  String fname;
  String address3;
  String address2;
  String city;
  String address1;
  String middlename;
  int accountNumber;
  String ownerid;
  String sortCode;
  String bank;
  String lname;
  String phoneNumber;
  String dob;
  String nickname;
  String postCode;
  String email;
  bool selected;

  factory Payee.fromJson(Map<String, dynamic> json) => Payee(
    country: json["country"]==null ? "" : json["country"],
    fname: json["fname"]==null ? "" : json["fname"],
    address3: json["address3"]==null ? "" : json["address3"],
    address2: json["address2"]==null ? "" : json["address2"],
    city: json["city"]==null ? "" : json["city"],
    address1: json["address1"]==null ? "" : json["address1"],
    middlename: json["middlename"]==null ? "" : json["middlename"],
    accountNumber: json["accountNumber"]==null ? 000 : json["accountNumber"],
    ownerid: json["ownerid"]==null ? "" : json["ownerid"],
    sortCode: json["sortCode"]==null ? 0 : json["sortCode"],
    bank: json["bank"]==null ? "" : json["bank"],
    lname: json["lname"]==null ? "" : json["lname"],
    phoneNumber: json["phoneNumber"]==null ? "" : json["phoneNumber"],
    dob: json["dob"]==null ? "" : json["dob"],
    nickname: json["nickname"]==null ? "" : json["nickname"],
    postCode: json["postCode"]==null ? "" : json["postCode"],
    email: json["email"]==null ? "" : json["email"],
    selected: false
  );

  Map<String, dynamic> toJson() => {
    "country": country,
    "fname": fname,
    "address3": address3,
    "address2": address2,
    "city": city,
    "address1": address1,
    "middlename": middlename,
    "accountNumber": accountNumber,
    "ownerid": ownerid,
    "sortCode": sortCode,
    "bank": bank,
    "lname": lname,
    "phoneNumber": phoneNumber,
    "dob": dob,
    "nickname": nickname,
    "postCode": postCode,
    "email": email,
  };
}
