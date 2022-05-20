// To parse this JSON data, do
//
//     final manageChequeModel = manageChequeModelFromJson(jsonString);

import 'dart:convert';

ManageChequeModel manageChequeModelFromJson(String str) => ManageChequeModel.fromJson(json.decode(str));

String manageChequeModelToJson(ManageChequeModel data) => json.encode(data.toJson());

class ManageChequeModel {
  ManageChequeModel({
    required this.key,
    required this.chequeModel,
  });

  String key;
  ChequeModel chequeModel;

  factory ManageChequeModel.fromJson(Map<String, dynamic> json) => ManageChequeModel(
    key: json["key"],
    chequeModel: ChequeModel.fromJson(json["ChequeModel"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "ChequeModel": chequeModel.toJson(),
  };
}

class ChequeModel {
  ChequeModel({
    required this.date,
    required this.amount,
    required this.signature,
    required this.chequeno,
    required this.memo,
    required this.signid,
    required this.sortCode,
    required this.payee,
    required this.amountWords,
    required this.bank,
    required this.accountno,
    required this.comment,
    required this.payeeid,
    required this.email,
  });

  String date;
  int amount;
  String signature;
  String chequeno;
  String memo;
  String signid;
  String sortCode;
  String payee;
  String amountWords;
  String bank;
  String accountno;
  String comment;
  String payeeid;
  String email;
  bool selected=false;

  factory ChequeModel.fromJson(Map<String, dynamic> json) => ChequeModel(
    date: json["date"],
    amount: json["amount"],
    signature: json["signature"],
    chequeno: json["chequeno"],
    memo: json["memo"],
    signid: json["signid"],
    sortCode: json["sortCode"],
    payee: json["payee"],
    amountWords: json["amountWords"],
    bank: json["bank"],
    accountno: json["accountno"],
    comment: json["comment"],
    payeeid: json["payeeid"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "amount": amount,
    "signature": signature,
    "chequeno": chequeno,
    "memo": memo,
    "signid": signid,
    "sortCode": sortCode,
    "payee": payee,
    "amountWords": amountWords,
    "bank": bank,
    "accountno": accountno,
    "comment": comment,
    "payeeid": payeeid,
    "email": email,
  };
}
