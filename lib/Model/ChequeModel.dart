// To parse this JSON data, do
//
//     final chequeModel = chequeModelFromJson(jsonString);

import 'dart:convert';

ChequeModel chequeModelFromJson(String str) => ChequeModel.fromJson(json.decode(str));

String chequeModelToJson(ChequeModel data) => json.encode(data.toJson());

class ChequeModel {
  ChequeModel({
    required this.bank,
    required this.payee,
    required this.amountWords,
    required this.payeeid,
    required this.amount,
    required this.date,
    required this.signature,
    required this.signid,
    required this.memo,
    required this.comment,
    required this.chequeno,
    required this.accountno,
    required this.sortCode,
    required this.email,
  });

  String bank;
  String payee;
  String amountWords;
  String payeeid;
  int amount;
  String date;
  String signature;
  String signid;
  String memo;
  String comment;
  String chequeno;
  String accountno;
  String sortCode;
  String email;

  factory ChequeModel.fromJson(Map<String, dynamic> json) => ChequeModel(
    bank: json["bank"],
    payee: json["payee"],
    amountWords: json["amountWords"],
    payeeid: json["payeeid"],
    amount: json["amount"],
    date: json["date"],
    signature: json["signature"],
    signid: json["signid"],
    memo: json["memo"],
    comment: json["comment"],
    chequeno: json["chequeno"],
    accountno: json["accountno"],
    sortCode: json["sortCode"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "bank": bank,
    "payee": payee,
    "amountWords": amountWords,
    "payeeid": payeeid,
    "amount": amount,
    "date": date,
    "signature": signature,
    "signid": signid,
    "memo": memo,
    "comment": comment,
    "chequeno": chequeno,
    "accountno": accountno,
    "sortCode": sortCode,
    "email": email,
  };
}
