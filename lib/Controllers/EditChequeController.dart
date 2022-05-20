
import 'dart:convert';
import 'dart:io';

import 'package:chequewallet/Model/AccountsModel.dart';
import 'package:chequewallet/Model/AllSignatureModel.dart';
import 'package:chequewallet/Model/AllpayeesModel.dart';
import 'package:chequewallet/SendEmail/SendEmail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

import '../Validation/Validation.dart';
import '../Views/Email_Sent.dart';
import '../Views/ManageCheque.dart';

class EditChequeController extends GetxController
{
  var isLoading=false.obs;
  var payees=<AllpayeesModel>[].obs;
  var myAccounts=<AccountsModel>[].obs;
  var signa=<AllSignatureModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadAccountDetails();
  }

  Future loadAccountDetails()async
  {
    try{
      isLoading.value=true;
      final accounts=FirebaseDatabase.instance.ref("bankAccounts");
      final payee=FirebaseDatabase.instance.ref("Payee");
      final signatures=FirebaseDatabase.instance.ref("signature");

      var ac=await accounts.child(FirebaseAuth.instance.currentUser!.uid).once();
      var py=await payee.once();
      var signs=await signatures.child(FirebaseAuth.instance.currentUser!.uid).once();
      if(ac.snapshot!=null)
      {
        for(DataSnapshot snapshot in ac.snapshot.children)
        {
          Map map=new Map();
          String key=snapshot.key.toString();
          map.addIf(true,"key",key);
          map.addIf(true,"BankAccountsModel",snapshot.value);
          myAccounts.add(accountsModelFromJson(jsonEncode(map)));
        }
      }
      if(py.snapshot!=null)
      {
        for(DataSnapshot snapshot in py.snapshot.children)
        {
          Map map=new Map();
          String key=snapshot.key.toString();
          map.addIf(true,"key",key);
          map.addIf(true,"payee",snapshot.value);
          payees.add(allpayeesModelFromJson(jsonEncode(map)));
        }
      }
      if(signs.snapshot!=null)
      {
        for(DataSnapshot snapshot in signs.snapshot.children)
        {
          Map map=new Map();
          String key=snapshot.key.toString();
          map.addIf(true,"key",key);
          map.addIf(true,"SignModel",snapshot.value);
          signa.add(allSignatureModelFromJson(jsonEncode(map)));
        }
      }
      isLoading.value=false;
    }catch(e)
    {
      isLoading.value=false;
      Get.snackbar("Error", e.toString());
    }
  }



  Future createCheque(var payload,String key)async
  {
    try{
      isLoading.value=true;
      final ref=FirebaseDatabase.instance.ref("cheques");

      await ref.child(FirebaseAuth.instance.currentUser!.uid).child(key).set(payload);
      isLoading.value=false;
      Get.to(()=>ManageCheque());
    }catch(e)
    {
      isLoading.value=false;
      ShowErrorAlert(e.toString());
    }
  }
}