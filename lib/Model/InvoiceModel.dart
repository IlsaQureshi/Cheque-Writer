// To parse this JSON data, do
//
//     final invoiceMmodel = invoiceMmodelFromJson(jsonString);

import 'dart:convert';

InvoiceMmodel invoiceMmodelFromJson(String str) => InvoiceMmodel.fromJson(json.decode(str));

String invoiceMmodelToJson(InvoiceMmodel data) => json.encode(data.toJson());

class InvoiceMmodel {
  InvoiceMmodel({
    required this.key,
    required this.image,
  });

  String key;
  Image image;

  factory InvoiceMmodel.fromJson(Map<String, dynamic> json) => InvoiceMmodel(
    key: json["key"],
    image: Image.fromJson(json["image"]),
  );

  Map<String, dynamic> toJson() => {
    "key": key,
    "image": image.toJson(),
  };
}

class Image {
  Image({
    required this.invoice,
  });

  String invoice;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    invoice: json["invoice"],
  );

  Map<String, dynamic> toJson() => {
    "invoice": invoice,
  };
}
