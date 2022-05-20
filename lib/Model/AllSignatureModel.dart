// To parse this JSON data, do
//
//     final allSignatureModel = allSignatureModelFromJson(jsonString);

import 'dart:convert';

AllSignatureModel allSignatureModelFromJson(String str) => AllSignatureModel.fromJson(json.decode(str));

String allSignatureModelToJson(AllSignatureModel data) => json.encode(data.toJson());

class AllSignatureModel {
  AllSignatureModel({
    required this.key,
    required this.signModel,
    required this.selected
  });

  String key;
  SignModel signModel;
  bool selected;

  factory AllSignatureModel.fromJson(Map<String, dynamic> json) => AllSignatureModel(
    key: json["key"],
    signModel: SignModel.fromJson(json["SignModel"]),
    selected: false
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "SignModel": signModel.toJson(),
  };
}

class SignModel {
  SignModel({
    required this.name,
    required this.sign,
  });

  String name;
  String sign;

  factory SignModel.fromJson(Map<String, dynamic> json) => SignModel(
    name: json["name"],
    sign: json["sign"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "sign": sign,
  };
}
