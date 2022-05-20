// To parse this JSON data, do
//
//     final accountsModel = accountsModelFromJson(jsonString);

import 'dart:convert';

AccountsModel accountsModelFromJson(String str) => AccountsModel.fromJson(json.decode(str));

String accountsModelToJson(AccountsModel data) => json.encode(data.toJson());

class AccountsModel {
  AccountsModel({
    required this.key,
    required this.bankAccountsModel,
  });

  String key;
  BankAccountsModel bankAccountsModel;

  factory AccountsModel.fromJson(Map<String, dynamic> json) => AccountsModel(
    key: json["key"],
    bankAccountsModel: BankAccountsModel.fromJson(json["BankAccountsModel"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "BankAccountsModel": bankAccountsModel.toJson(),
  };
}

class BankAccountsModel {
  BankAccountsModel({
    required this.fname,
    required this.bank,
    required this.lname,
    required this.dob,
    required this.middlename,
    required this.accountNumber,
    required this.sortCode,
  });

  String fname;
  String bank;
  String lname;
  String dob;
  String middlename;
  String accountNumber;
  String sortCode;
  bool selected=false;

  factory BankAccountsModel.fromJson(Map<String, dynamic> json) => BankAccountsModel(
    fname: json["fname"],
    bank: json["bank"],
    lname: json["lname"],
    dob: json["dob"],
    middlename: json["middlename"],
    accountNumber: json["accountNumber"],
    sortCode: json["sortCode"],
  );

  Map<String, dynamic> toJson() => {
    "fname": fname,
    "bank": bank,
    "lname": lname,
    "dob": dob,
    "middlename": middlename,
    "accountNumber": accountNumber,
    "sortCode": sortCode,
  };
}
