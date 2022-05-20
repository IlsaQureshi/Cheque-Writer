
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void ShowErrorAlert(String err)
{
  Get.snackbar("Error", err.toString(),backgroundColor: Colors.red,colorText: Colors.white);
}

  bool DateValidation(String date)
  {
    String pattern=r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$";
    RegExp exp=new RegExp(pattern);
    if(exp.hasMatch(date)) {
      print("valid");
      return true;
    }
    else
      ShowErrorAlert("invalid Date format");
    return false;

}